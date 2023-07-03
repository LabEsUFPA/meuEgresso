package labes.facomp.ufpa.br.meuegresso.config.audit;

import java.util.Optional;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

import labes.facomp.ufpa.br.meuegresso.enumeration.JwtUtils;
import lombok.RequiredArgsConstructor;

/**
 * Responsável pelas configurações de audição da aplicação.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Configuration
@EnableJpaAuditing
@RequiredArgsConstructor
public class AuditConfig {

	@Bean
	public AuditorAware<Integer> auditorAware() {
		return () -> {
			JwtAuthenticationToken authToken = SecurityContextHolder.getContext()
					.getAuthentication() instanceof JwtAuthenticationToken
							? (JwtAuthenticationToken) SecurityContextHolder.getContext().getAuthentication()
							: null;

			if (authToken != null) {
				Integer userId = Integer
						.parseInt(authToken.getTokenAttributes().get(JwtUtils.USER_ID.getPropriedade()).toString());
				return Optional.of(userId);
			} else
				return Optional.ofNullable(null);
		};
	}
}
