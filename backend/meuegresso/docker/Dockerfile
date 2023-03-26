FROM openjdk:19
RUN mvn install
VOLUME /tmp
COPY target/*.jar app.jar
EXPOSE 15000
ENTRYPOINT ["java","-jar", "-Dspring.profiles.active=prod","/app.jar"]