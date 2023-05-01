package labes.facomp.ufpa.br.meuegresso.util;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class ParseString implements AttributeConverter<String, String> {

    @Override
    public String convertToDatabaseColumn(String value) {
        if (value.equals("")) {
            return null;
        } else {
            return value;
        }
    }

    @Override
    public String convertToEntityAttribute(String value) {
        if (value.equals("")) {
            return null;
        } else {
            return value;
        }
    }

}
