package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum ErrorType {

    REPORT_001("Requisição inválida.", "RP-001"),

    REPORT_002("Relatório com ID = %s não encontrado.", "RP-002"),

    REPORT_004("Recurso não encontrado.", "RP-004"),

    REPORT_005("Erro no JSON do corpo da requisição.", "RP-005"),

    REPORT_006("Erro ao enviar o email.", "RP-006"),

    REPORT_009("Não é permitido enviar lista vazia no corpo da requisição!", "RP-009"),

    DATABASE_001("Falha ao tentar salvar no banco de dados.", "DB-001"),

    DATABASE_002("Nenhuma mensagem de email do tipo %s cadastrada.", "DB-002"),

    UNAUTHORIZED_TRANSACTION("Permisões insuficientes para realizar esta transação", "SECURITY-001"),

    USER_001("Usuário %s ja existe.", "US-001"),

    USER_002("Usuario ou Senha inválida.", "US-002"),

    EGRESSO_NAO_VALIDO("Usuario não cadastrado pela faculdade", "EV-001"),

    FOTO_NAO_ENCONTRADA("Egresso não possui foto","E-001");

    private String message;
    private String internalCode;

    private ErrorType(String message, String internalCode) {
        this.message = message;
        this.internalCode = internalCode;
    }

}
