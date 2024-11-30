FROM bitnami/java:21

RUN apt update && apt install -y maven

WORKDIR /build
COPY pom.xml /build/
COPY src/ /build/src

RUN mvn verify

ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/build/target/words.jar"]
EXPOSE 8080
