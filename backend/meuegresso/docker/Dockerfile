FROM openjdk:17
FROM amazoncorretto:17.0.7
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar", "-Dspring.profiles.active=prod","/app.jar"]