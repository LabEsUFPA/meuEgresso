package labes.facomp.ufpa.br.meuegresso.service.grupo;

import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 26/03/2023
 * @version 1.0.1
 */
public interface GrupoService {

	/**
	 * Método responsável por persistir determinado grupo no banco de dados.
	 *
	 * @param grupoModel Dados do grupo
	 * @return Dados após serem gravados no banco de dados.
	 */
	public GrupoModel save(GrupoModel grupoModel);

	/**
	 * Método responsável por encontrar um determinado grupo por sua ID.
	 *
	 * @param id
	 * @return
	 */
	public GrupoModel findById(Integer id);

	/**
	 * Método responsável por encontrar um determinado grupo por seu nome.
	 *
	 * @param id
	 * @return
	 */
	public GrupoModel findByNomeGrupo(String nomeGrupo);

	/**
	 * Método responsável por atualizar os dados de um determinado grupo cadastrado.
	 *
	 * @param grupoModel
	 * @return Dados atualizados do grupo ao banco de dados.
	 */
	public GrupoModel update(GrupoModel grupoModel);

}
