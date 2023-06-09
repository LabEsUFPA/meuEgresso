package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

public interface EgressoRepository extends CrudRepository<EgressoModel, Integer> {

    List<EgressoModel> findAll();

    Optional<EgressoModel> findByIdAndUsuarioValidoIsTrue(Integer id);

    List<EgressoModel> findAllByUsuarioValidoIsTrue();


    Optional<EgressoModel> findByUsuarioId(Integer idUsuario);

    boolean existsByUsuarioId(Integer id);

    boolean existsByMatricula(String matricula);

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    @Query(value = "select extract(year from age(CURRENT_DATE, e.nascimento_egresso)), count(*) from egresso e group by e.nascimento_egresso", nativeQuery = true)
    List<Tuple> countAgeFromEgressos();

    @Query(value = "select e.posGraduacao, count(e) from egresso e group by e.posGraduacao")
    List<Tuple> countFezPos();

    @Query(value = "select e.cotista, count(e) from egresso e group by e.cotista")
    List<Tuple> countCotista();

    @Query(value = "select e.interesseEmPos, count(e) from egresso e group by e.interesseEmPos")
    List<Tuple> countInteressePos();

    @Query(value = "select e.bolsista, count(e) from egresso e group by e.bolsista")
    List<Tuple> countBolsista();

    @Query(value = "select DATE(e.createdDate), count(e.id) from egresso e group by DATE(e.createdDate) order by DATE(e.createdDate) DESC")
    List<Tuple> countEgressoData();

    @Query(value = "select e.remuneracaoBolsa, count(e) from egresso e where e.remuneracaoBolsa is not null group by e.remuneracaoBolsa ")
    List<Tuple> countRemuneracaoBolsa();

    void deleteAll();
}
