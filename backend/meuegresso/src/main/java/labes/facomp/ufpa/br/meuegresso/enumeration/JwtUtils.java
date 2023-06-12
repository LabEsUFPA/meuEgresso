package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum JwtUtils {
    USER_ID("idUsuario"),
    NOME("nome"),
    EMAIL("email"),
    SOBRENOME("sobrenome"),
    EGRESSO("isEgresso"),
    SCOPE("scope");

    private String propriedade;

    private JwtUtils(String propriedade) {
        this.propriedade = propriedade;
    }
}
