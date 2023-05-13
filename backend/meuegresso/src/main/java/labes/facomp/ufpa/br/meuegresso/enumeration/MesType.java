package labes.facomp.ufpa.br.meuegresso.enumeration;

import lombok.Getter;

@Getter
public enum MesType {
    JAN("JANEIRO"),
    FEV("FEVEREIRO"),
    MAR("MARCO"),
    ABR("ABRIL"),
    MAI("MAIO"),
    JUN("JUNHO"),
    JUL("JULHO"),
    AGO("AGOSTO"),
    SET("SETEMBRO"),
    OUT("OUTUBRO"),
    NOV("NOVEMBRO"),
    DEZ("DEZEMBRO");

    private String mes;

    private MesType(String mes) {
        this.mes = mes;
    }
}
