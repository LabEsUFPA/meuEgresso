package labes.facomp.ufpa.br.meuegresso.controller.cota;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.service.cota.CotaService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para Cota.
 *
 * @author Bruno Eiki
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/cota")
public class CotaController {

    private final CotaService cotaService;

    private final ModelMapper mapper;

    /**
     * Endpoint responsavel por buscar todas as cotas no banco.
     *
     * @param void
     * @return {@link List<CotaDTO>} Retorna uma lista com todos os CotaDTO.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<CotaDTO> buscarCotas() {
        return mapper.map(cotaService.findAll(), new TypeToken<List<CotaDTO>>() {
        }.getType());
    }

    /**
     * Endpoint responsavel por atualizar uma Cota no banco.
     *
     * @param cotaDTO Estrutura de dados contendo as informações necessárias para
     *                adicionar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public String cadastrarCota(
            @RequestBody @Valid CotaDTO cotaDTO) {

        CotaModel cotaModel = mapper.map(cotaDTO, CotaModel.class);
        cotaService.save(cotaModel);
        return ResponseType.SUCESS_SAVE.getMessage();
    }

    /**
     * Endpoint responsavel por atualizar uma Cota no banco.
     *
     * @param cotaDTO Estrutura de dados contendo as informações necessárias para
     *                atualizar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @PutMapping
    @ResponseStatus(code = HttpStatus.ACCEPTED)
    public String atualizarCota(@RequestBody @Valid CotaDTO cotaDTO) throws InvalidRequestException {

        CotaModel cotaModel = mapper.map(cotaDTO, CotaModel.class);
        cotaService.update(cotaModel);
        return ResponseType.SUCESS_UPDATE.getMessage();
    }

    /**
     * Endpoint responsavel por deletar a cota.
     *
     * @param cotaDTO Estrutura de dados contendo as informações necessárias para
     *                deletar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    public String deletarCota(@RequestBody @Valid CotaDTO cotaDTO) {

        CotaModel cotaModel = mapper.map(cotaDTO, CotaModel.class);
        cotaService.deleteById(cotaModel.getId());
        return ResponseType.SUCESS_DELETE.getMessage();
    }
}
