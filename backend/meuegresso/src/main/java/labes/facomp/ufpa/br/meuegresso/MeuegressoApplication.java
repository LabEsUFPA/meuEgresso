package labes.facomp.ufpa.br.meuegresso;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MeuegressoApplication {

	public static void main(String[] args) {
		SpringApplication.run(MeuegressoApplication.class, args);
	}
}
