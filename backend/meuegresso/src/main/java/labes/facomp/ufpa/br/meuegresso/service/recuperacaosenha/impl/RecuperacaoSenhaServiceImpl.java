package labes.facomp.ufpa.br.meuegresso.service.recuperacaosenha.impl;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import jakarta.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.RecuperacaoSenhaModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.projections.usuario.RecoveryPasswordProjection;
import labes.facomp.ufpa.br.meuegresso.repository.recuperacaosenha.RecuperacaoSenhaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import labes.facomp.ufpa.br.meuegresso.service.recuperacaosenha.RecuperacaoSenhaService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecuperacaoSenhaServiceImpl implements RecuperacaoSenhaService {

    private final MailService mailService;

    private final UsuarioRepository usuarioRepository;

    private final RecuperacaoSenhaRepository recuperacaoSenhaRepository;

    private static final String TITULO_REDEFINICAO_SENHA = "Solicitação de Redefinição de Senha";

    private static final String MENSAGEM_REDEFINICAO = "Saudações %s%nFoi solicitado a redefinição de senha, segue abaixo o link para o mesmo.%n%s";

    @Override
    public boolean cadastrarSolicitacaoRecuperacao(String email, String redirect) {
        Optional<RecuperacaoSenhaModel> anterior = recuperacaoSenhaRepository
                .findTopByUsuarioEmailAndPasswordChangeIsFalse(email);
        anterior.ifPresent(e -> {
            e.setPasswordChange(true);
            recuperacaoSenhaRepository.save(e);
        });
        Optional<RecoveryPasswordProjection> projectionOptional = usuarioRepository.findByEmailIgnoreCase(email, RecoveryPasswordProjection.class);
        if (projectionOptional.isPresent()) {
            RecoveryPasswordProjection projection = projectionOptional.get();
            RecuperacaoSenhaModel recuperacaoSenha = RecuperacaoSenhaModel.builder().token(UUID.randomUUID())
                    .usuario(UsuarioModel.builder().id(projection.getId()).build())
                    .passwordChange(Boolean.FALSE).prazoFinal(LocalDateTime.now().plusMinutes(3)).build();
            recuperacaoSenha = recuperacaoSenhaRepository.save(recuperacaoSenha);
            URI location = UriComponentsBuilder.fromHttpUrl(redirect)
                    .queryParam("tokenAuth", recuperacaoSenha.getToken()).build().toUri();
            new Thread(() -> mailService.sendEmail(email, TITULO_REDEFINICAO_SENHA, String.format(MENSAGEM_REDEFINICAO, projection.getNome(), location.toString()))).start();
            return true;
        } else {
            return false;
        }

    }

    public RecuperacaoSenhaModel save(RecuperacaoSenhaModel recuperacaoSenha) {
        return recuperacaoSenhaRepository.save(recuperacaoSenha);
    }

    @Override
    public RecuperacaoSenhaModel tokenValido(UUID token) throws UnauthorizedRequestException {
        return recuperacaoSenhaRepository.findByToken(token).orElseThrow(UnauthorizedRequestException::new);
    }

    @Override
    @Transactional
    public boolean deleteByUsuarioId(Integer idUsuario) {
        if (recuperacaoSenhaRepository.existsByUsuario_Id(idUsuario)) {
            recuperacaoSenhaRepository.deleteByUsuario_Id(idUsuario);
            return true;
        }
        return false;
    }
}
