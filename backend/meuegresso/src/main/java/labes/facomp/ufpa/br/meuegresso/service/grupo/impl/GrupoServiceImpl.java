package labes.facomp.ufpa.br.meuegresso.service.grupo.impl;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.service.grupo.GrupoService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação referente ao grupo.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class GrupoServiceImpl implements GrupoService {

	private final GrupoRepository grupoRepository;

	/**
	 * Metodo responsavel por persistir determinado grupo no banco de dados.
	 *
	 * @param grupoModel Dados do grupo
	 * @return Dados após serem gravados no banco de dados.
	 */
	public GrupoModel save(GrupoModel grupoModel){
		return grupoRepository.save(grupoModel);
	}

	@Override
	public GrupoModel update(GrupoModel grupoModel) {
		if (grupoModel.getIdGrupo() != null) {
			return grupoRepository.save(grupoModel);
		}
		return null;
	}

	/**
	 * Metodo responsavel por encontrar um determinado grupo por sua ID.
	 *
	 * @param idGrupo
	 * @return
	 */
	public GrupoModel findById(Integer idGrupo){
		return grupoRepository.findById(idGrupo).orElseThrow();
	}

	/**
	 * Metodo responsavel por encontrar um determinado grupo por seu nome.
	 *
	 * @param idGrupo
	 * @return
	 */
	public GrupoModel findByNomeGrupo(String nomeGrupo){
		return grupoRepository.findByNomeGrupo(nomeGrupo).orElseThrow();
	}

}
