package labes.facomp.ufpa.br.meuegresso.service.anuncio;

import java.time.LocalDate;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface AnuncioService {

	/**
	 * Método responsável por persistir determinado anuncio no banco de dados.
	 *
	 * @param anuncioModel Dados do anuncio
	 * @return Dados após serem gravados no banco de dados.
	 */
	public AnuncioModel save(AnuncioModel anuncioModel);

	/**
	 * Método responsável por encontrar um determinado anuncio por sua ID.
	 *
	 * @param id ID de um anuncio
	 * @return
	 */
	public AnuncioModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os anuncios cadastrados validos pelo
	 * filtro passado.
	 *
	 * @return Lista de objetos da classe AnuncioModel.
	 */

	Page<AnuncioModel> findBySearch(String tituloAnuncio, Integer[] areaEmpregoIds, Integer page, Integer size,
			Direction direction);

	/**
	 * Método responsável por encontrar todos os anuncios cadastrados.
	 *
	 * @return Lista de objetos da classe AnuncioModel.
	 */

	public Page<AnuncioModel> findAll(Integer page, Integer size, Direction direction);

	/**
	 * Método responsável por atualizar dados de um anuncio cadastrado.
	 *
	 * @param anuncio objeto anuncio
	 * @return
	 */
	public AnuncioModel update(AnuncioModel anuncio) throws InvalidRequestException;

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

	Page<AnuncioModel> findByDataExpiracaoAfter(LocalDate dataExpiracao, Integer page, Integer size,
			Direction direction);

}
