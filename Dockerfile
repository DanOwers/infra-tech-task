FROM openjdk:8-jdk-alpine
RUN apk --no-cache add curl
WORKDIR /tmp/workdir
COPY target/spring-*.jar rezdy-application.jar
ENTRYPOINT ["java", "-jar", "rezdy-application.jar"]
EXPOSE 8080