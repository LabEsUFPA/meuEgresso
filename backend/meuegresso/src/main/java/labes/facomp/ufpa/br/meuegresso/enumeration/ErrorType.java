package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum ErrorType {

    REPORT_001("Requisição inválida.", "RP-001"),

    REPORT_002("Relatório com ID = %s não encontrado.", "RP-002"),

    REPORT_003("Senha inválida.", "RP-003"),

    REPORT_004("Recurso não encontrado.", "RP-004"),

    REPORT_005("Erro no JSON do corpo da requisição.", "RP-005"),

    REPORT_006("Erro ao enviar o email.", "RP-006"),

    REPORT_009("Não é permitido enviar lista vazia no corpo da requisição!", "RP-009"),

    DATABASE_001("Falha ao tentar salvar no banco de dados.", "DB-001"),

    DATABASE_002("Nenhuma mensagem de email do tipo %s cadastrada.", "DB-002"),

    USER_001("Usuário %s não existe.", "US-001");

    private String message;
    private String internalCode;

    private ErrorType(String message, String internalCode) {
        this.message = message;
        this.internalCode = internalCode;
    }

}
