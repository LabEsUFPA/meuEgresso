package labes.facomp.ufpa.br.meuegresso.controller.empresa;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
import lombok.RequiredArgsConstructor;


/**
 * Responsável por fornecer um end-point para criar um novo empresa.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/empresa")
public class EmpresaController {

	private final EmpresaService empresaService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista de empresa cadastrados no banco de dados.
	 * 
	 * @return {@link EmpresaDTO} Lista de empresa cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	public List<EmpresaDTO> consultarEmpresas() {
		return mapper.map(empresaService.findAll(), new TypeToken<List<EmpresaDTO>>() {
		}.getType());
	}

	

	/**
	 * Endpoint responsável por retornar um empresa por sua ID.
	 * 
	 * @param id Integer
	 * @return {@link EmpresaDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public EmpresaDTO findById(@PathVariable Integer id) {
		return mapper.map(empresaService.findById(id), EmpresaDTO.class);
	}


	/**
	 * Endpoint responsavel por cadastrar o empresa.
	 *
	 * @param empresaDTO Estrutura de dados contendo as informações necessárias para persistir o empresa.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link EmpresaDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarEmpresa(@RequestBody @Valid EmpresaDTO empresaDTO) {
		EmpresaModel empresaModel = mapper.map(empresaDTO, EmpresaModel.class);
		empresaService.save(empresaModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o empresa.
	 * 
	 * @param empresaDTO Estrutura de dados contendo as informações necessárias para
	 *                   atualizar o empresa.
	 * @return {@link EmpresaDTO} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public EmpresaDTO atualizarEmpresa(@RequestBody @Valid EmpresaDTO empresaDTO) {
		EmpresaModel empresaModel = mapper.map(empresaDTO, EmpresaModel.class);
		empresaModel = empresaService.save(empresaModel);
		return mapper.map(empresaModel, EmpresaDTO.class);
	}

	/**
	 * Endpoint responsável por deletar empresa por sua ID>
	 * 
	 * @param id Integer
	 * @return Boolean
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(Integer id) {
		return empresaService.deleteById(id);
	}
	
}
