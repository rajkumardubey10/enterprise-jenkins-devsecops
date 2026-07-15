## Stage 1 - Build-stage

FROM eclipse-temurin:17-jdk AS builder

WORKDIR /build 

COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

## Stage 2 - Runtime

FROM eclipse-temurin:17-jre

# creating the non-root user
RUN groupadd -r spring && \
    useradd -r -g spring -m -s /usr/sbin/nologin spring

WORKDIR /app

COPY --from=builder /build/target/*.jar  app.jar

# Changing the ownership 
RUN chown -R spring:spring /app

# switching to non-root user
USER spring

EXPOSE 8085

ENTRYPOINT [ "java", "-jar", "app.jar" ]
