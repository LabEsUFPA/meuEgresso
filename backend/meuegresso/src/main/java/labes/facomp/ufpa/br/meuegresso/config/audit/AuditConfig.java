package labes.facomp.ufpa.br.meuegresso.config.audit;

import java.util.Optional;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import lombok.RequiredArgsConstructor;

/**
 * Responsável pelas configurações de audição da aplicação.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Configuration
@EnableJpaAuditing
@RequiredArgsConstructor
public class AuditConfig {

    private final UsuarioRepository userRepository;

    @Bean
    public AuditorAware<UsuarioModel> auditorAware() {
        return () -> {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null) {
                return Optional.of(userRepository.findByUsername(auth.getName()).orElse(null));
            } else {
                return Optional.ofNullable(null);
            }
        };
    }
}
