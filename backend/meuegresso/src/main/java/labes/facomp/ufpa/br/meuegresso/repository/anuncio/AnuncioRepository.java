package labes.facomp.ufpa.br.meuegresso.repository.anuncio;

import java.time.LocalDate;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;

public interface AnuncioRepository extends CrudRepository<AnuncioModel, Integer> {

    Page<AnuncioModel> findAll(Pageable page);

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    @Query(value = """
            select a
            from
                anuncio a
            inner join usuario u on
            u.id = a.createdBy
            where
                a.dataExpiracao >= now()
                and a.titulo ilike :tituloAnuncio
                and (a.areaEmprego.id in (:areaEmpregoIds) or 0 in (:areaEmpregoIds))
                """)
    Page<AnuncioModel> findBySearch(String tituloAnuncio, Integer[] areaEmpregoIds, Pageable page);

    Page<AnuncioModel> findByDataExpiracaoAfter(LocalDate dataExpiracao, Pageable page);
}
