FROM maven:3.9.9-eclipse-temurin-23 AS build

WORKDIR /build

COPY pom.xml /build/
RUN mvn dependency:go-offline

COPY src/ /build/src
RUN mvn verify

RUN jdeps --ignore-missing-deps -q \
    --recursive \
    --multi-release 17 \
    --print-module-deps \
    --class-path 'BOOT-INF/lib/*' \
    target/words.jar > deps.info

FROM eclipse-temurin:23-alpine AS jre-build

COPY --from=build /build/deps.info /build/deps.info

RUN jlink \
    --add-modules $(cat /build/deps.info) \
    --strip-debug \
    --compress 2 \
    --no-header-files \
    --no-man-pages \
    --output /javaruntime

FROM alpine:3.20

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

WORKDIR /app

COPY --from=jre-build /javaruntime $JAVA_HOME
COPY --from=build /build/target/ /app/

ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/app/words.jar"]
EXPOSE 8080
