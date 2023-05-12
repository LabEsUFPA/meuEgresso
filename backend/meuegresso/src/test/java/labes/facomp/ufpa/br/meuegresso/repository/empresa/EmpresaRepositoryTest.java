package labes.facomp.ufpa.br.meuegresso.repository.empresa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

@SpringBootTest
@ActiveProfiles("test")
class EmpresaRepositoryTest {

    @Autowired
    @MockBean
    private EmpresaRepository repository;

    private EmpresaModel empresa;

    @BeforeEach
    void setUp() {
        empresa = new EmpresaModel();
        empresa.setId(1);
        empresa.setNome("El Cabis");
        /*
         * testarEgresso.setGenero(null);
         * testarEgresso.setEndereco(null);
         * testarEgresso.setUsuario(null);
         * testarEgresso.setDepoimentos(null);
         */

        repository.save(empresa);

    }

    @Test
    void testFindAll() {
        List<EmpresaModel> empresas = repository.findAll();
        assertNotNull(empresas);
    }

    @Test
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EmpresaModel.class)))
                .willReturn(EmpresaModel.builder().id(2).nome("El Cabis").build());
        EmpresaModel response = repository.save(new EmpresaModel());

        assertNotNull(response);
        assertEquals("El Cabis", response.getNome());
    }

}
