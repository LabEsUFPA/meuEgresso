package labes.facomp.ufpa.br.meuegresso.service.grupo;

import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
public interface GrupoService {

	/**
	 * Metodo responsavel por persistir determinado grupo no banco de dados.
	 *
	 * @param grupoModel Dados do grupo
	 * @return Dados após serem gravados no banco de dados.
	 */
	public GrupoModel save(GrupoModel grupoModel);

	/**
	 * Metodo responsavel por encontrar um determinado grupo por sua ID.
	 *
	 * @param idGrupo
	 * @return
	 */
	public GrupoModel findById(Integer idGrupo);

	/**
	 * Metodo responsavel por encontrar um determinado grupo por seu nome.
	 *
	 * @param idGrupo
	 * @return
	 */
	public GrupoModel findByNomeGrupo(String nomeGrupo);

	public GrupoModel update(GrupoModel grupoModel);

}
