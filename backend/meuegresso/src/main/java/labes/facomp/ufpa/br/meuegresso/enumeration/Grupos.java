package labes.facomp.ufpa.br.meuegresso.enumeration;

import org.springframework.security.core.GrantedAuthority;

import lombok.Getter;

@Getter
public enum Grupos implements GrantedAuthority {

    ADMIN("ROLE_ADMIN"),
    SECRETARIO("ROLE_SECRETARIO"),
    EGRESSO("ROLE_EGRESSO");

    private String code;

    Grupos(String code) {
        this.code = code;
    }

    @Override
    public String getAuthority() {
        return this.code;
    }
}
