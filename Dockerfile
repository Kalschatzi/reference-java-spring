FROM gradle:jdk21 AS build
WORKDIR /build

COPY settings.gradle .
COPY service service

RUN gradle service:build --no-daemon

FROM registry.access.redhat.com/ubi8/openjdk-21:1.21
WORKDIR /
COPY --from=build /build/service/build/libs/service-*-SNAPSHOT.jar /service.jar

CMD ["java", "-jar", "service.jar"]

EXPOSE 8080