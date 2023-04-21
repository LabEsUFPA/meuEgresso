package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum ResponseType {

    USUARIO_SUCESS_SAVE("Usuário salvo com sucesso"),

    COTA_SUCESS_GET("Cota buscada com sucesso"),

    COTA_SUCESS_SAVE("Cota salva com sucesso"),

    COTA_SUCESS_UPDATE("Cota atualizada com sucesso"),

    COTA_SUCESS_DELETE("Cota deletada com sucesso");

    private String message;

    private ResponseType(String message) {
        this.message = message;
    }

}
