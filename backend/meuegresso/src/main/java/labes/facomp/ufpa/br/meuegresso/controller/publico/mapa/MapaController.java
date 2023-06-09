package labes.facomp.ufpa.br.meuegresso.controller.publico.mapa;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoMapaDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo usuário.
 *
 * @author Bruno
 * @since 26/03/2023
 * @version 1.0.1
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/publico/mapa")
public class MapaController {

    private final EgressoEmpresaService egressoEmpresaService;

    private final ModelMapper mapper;

    /**
     * Endpoint responsável por retornar uma lista de egressoMapaDTO para
     * disponibilizar dados no mapa sociodemográfico
     *
     * @param id Integer
     * @return {@link TIPO_RETORNO}
     * @author Bruno Eiki, Pedro Inácio
     * @since 08/05/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<EgressoMapaDTO> findAllEgressoMapaDTO() {
        List<EgressoEmpresaModel> egressoEmpresaModels = egressoEmpresaService.findAllEgressoMapa();

        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);

        return egressoEmpresaModels.stream().map(e -> {
            EgressoMapaDTO egressoMapa = mapper.map(e, EgressoMapaDTO.class);
            egressoMapa.setNomeEgresso(e.getEgresso().getUsuario().getNome());
            return egressoMapa;

        }).toList();
    }
}
