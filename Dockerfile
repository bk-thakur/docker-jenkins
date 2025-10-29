FROM openjdk:21
WORKDIR /app
COPY target/myapp.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
