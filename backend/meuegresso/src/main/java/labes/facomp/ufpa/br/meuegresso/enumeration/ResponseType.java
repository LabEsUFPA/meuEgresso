package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum ResponseType {

    SUCCESS_SAVE("Dado salvo com sucesso"),

    FAIL_SAVE("Credenciais insuficientes para cadastrar secretário/admin"),

    SUCCESS_UPDATE("Dado atualizado com sucesso"),

    SUCCESS_DELETE("Dado deletado com sucesso"),

    FAIL_DELETE("Dado não deletado"),

    EGRESSO_ENCONTRADO("Egresso encontrado"),

    SUCCESS_IMAGE_SAVE("Imagem salva com sucesso"),

    SUCCESS_IMAGE_DELETE("Imagem deletada com sucesso"),

    FAIL_IMAGE_DELETE("Usuário não tem imagem para deletar"),

    SOLICITACAO_REALIZADA_SUCESSO("Solicitação realizada com sucesso.");

    private String message;

    private ResponseType(String message) {
        this.message = message;
    }

}
