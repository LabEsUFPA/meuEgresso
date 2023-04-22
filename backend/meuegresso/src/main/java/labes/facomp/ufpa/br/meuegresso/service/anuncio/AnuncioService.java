package labes.facomp.ufpa.br.meuegresso.service.anuncio;

import java.util.List;

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
	 * Método responsável por encontrar todos os anuncios cadastrados.
	 * 
	 * @return Lista de objetos da classe AnuncioModel.
	 */
	public List<AnuncioModel> findAll();

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

}
