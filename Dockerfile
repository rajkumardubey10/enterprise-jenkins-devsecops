FROM eclipse-temurin:17-jre

## creating the group and new non-root user 
RUN groupadd -r spring && \
    useradd -r -g spring -m -s /usr/sbin/nologin spring

WORKDIR /app

## Copying the sign jar file in /app
COPY app.jar app.jar

## changing the ownership 
RUN chown spring:spring app.jar

## adding the user
USER spring

EXPOSE 8085

ENTRYPOINT ["java","-jar","app.jar"]