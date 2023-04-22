package labes.facomp.ufpa.br.meuegresso.service.contribuicao;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface ContribuicaoService {

	/**
	 * Método responsável por persistir determinado anuncio no banco de dados.
	 *
	 * @param anuncioModel Dados do anuncio
	 * @return Dados após serem gravados no banco de dados.
	 */
	public ContribuicaoModel save(ContribuicaoModel anuncioModel);

	/**
	 * Método responsável por encontrar um determinado anuncio por sua ID.
	 *
	 * @param id ID de um anuncio
	 * @return
	 */
	public ContribuicaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os anuncios cadastrados.
	 *
	 * @return Lista de objetos da classe ContribuicaoModel.
	 */
	public List<ContribuicaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um anuncio cadastrado.
	 *
	 * @param anuncio objeto anuncio
	 * @return
	 */
	public ContribuicaoModel update(ContribuicaoModel anuncio) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um anuncio cadastrado por sua ID.
	 *
	 * @param id ID de um anuncio
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return
	 */
    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);
}
