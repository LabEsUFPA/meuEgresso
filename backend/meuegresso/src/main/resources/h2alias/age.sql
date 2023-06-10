DROP ALIAS IF EXISTS AGE;

CREATE ALIAS AGE AS '
    java.time.LocalDate calculateAge(java.sql.Date currentDate, java.sql.Date birthDate) {
        if ((birthDate != null) && (currentDate != null)) {
            return java.time.LocalDate.of((int) java.time.temporal.ChronoUnit.YEARS.between(birthDate.toLocalDate(),
                    currentDate.toLocalDate()), 1, 1);
        } else {
            return null;
        }
    }
';