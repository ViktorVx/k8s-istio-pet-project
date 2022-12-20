FROM maven:3.8.6-openjdk-18-slim
COPY pom.xml /tmp/
COPY /src /tmp/src/
WORKDIR /tmp/
RUN mvn clean package

FROM openjdk:18.0.2.1-slim-buster
COPY --from=0 /tmp/target/k8s-istio-pet-project-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8080