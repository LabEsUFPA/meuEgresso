package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum ResponseType {

    USUARIO_SUCESS_SAVE("Usuário salvo com sucesso");

    private String message;

    private ResponseType(String message) {
        this.message = message;
    }

}
