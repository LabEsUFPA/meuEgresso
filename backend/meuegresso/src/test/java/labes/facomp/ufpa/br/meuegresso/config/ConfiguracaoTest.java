package labes.facomp.ufpa.br.meuegresso.config;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.jupiter.api.extension.RegisterExtension;

import com.icegreen.greenmail.configuration.GreenMailConfiguration;
import com.icegreen.greenmail.junit5.GreenMailExtension;
import com.icegreen.greenmail.util.ServerSetupTest;

public class ConfiguracaoTest {

    @RegisterExtension
    static GreenMailExtension greenMail = new GreenMailExtension(ServerSetupTest.SMTP)
            .withConfiguration(GreenMailConfiguration.aConfig().withUser("user", "admin"))
            .withPerMethodLifecycle(false);

    @Test
    void naoTeste() {
        long a = 5 * 5;
        assertEquals("Tudo certo", 25, a);
    }

}
