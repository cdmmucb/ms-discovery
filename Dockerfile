#FROM azul/zulu-openjdk:11.0.10
#RUN apt update

#ARG DEPENDENCY=target/dependency
#COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY ${DEPENDENCY}/META-INF /app/META-INF
#COPY ${DEPENDENCY}/BOOT-INF/classes /app

#ENV EUREKA_URI "http://localhost:8761/eureka"
#ENV SERVER_PORT 8761

#ENTRYPOINT [ "java","-cp","app:app/lib/*","/com.example.msdiscovery.MsDiscoveryApplication" ]

FROM azul/zulu-openjdk:11.0.10 as test
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

ENV EUREKA_URI "http://localhost:8761/eureka"
ENV SERVER_PORT 8761

ENTRYPOINT [ "java","-cp","app:app/lib/*","/com.example.msdiscovery.MsDiscoveryApplication" ]