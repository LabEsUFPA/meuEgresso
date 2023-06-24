package labes.facomp.ufpa.br.meuegresso.controller.publico.areaemprego;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.areaemprego.AreaEmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.service.areaemprego.AreaEmpregoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para area de emprego do anúncio.
 *
 * @author Lucas Cantão
 * @since 18/05/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/publico/areaemprego")
public class AreaEmpregoController {

    private final AreaEmpregoService areaEmpregoService;

    private final ModelMapper mapper;

    /**
     * Endpoint responsavel por buscar todas as áreas de emprego.
     *
     * @return {@link List<AreaEmpregoDTO>} Retorna uma lista com todas as áreas de
     *         emprego.
     * @author Lucas Cantão
     * @since 18/05/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<AreaEmpregoDTO> consultarAreasEmprego() {
        return mapper.map(areaEmpregoService.findAll(), new TypeToken<List<AreaEmpregoDTO>>() {
        }.getType());
    }
}
