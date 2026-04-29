FROM eclipse-temurin:21-jdk-alpine
LABEL "language"="java"
LABEL "framework"="peergos"

WORKDIR /opt/peergos

# Download Peergos server
RUN wget -q https://github.com/Peergos/Peergos/releases/download/v0.3.5/Peergos.jar && \
    chmod +x Peergos.jar

ENV PEERGOS_PATH=/data
ENV PEERGOS_PORT=7777

RUN mkdir -p /data

EXPOSE 7777 4001 5001

CMD ["java", "-Dpeergos.port=7777", "-Dpeergos.ipfs.bind.address=0.0.0.0", "-jar", "Peergos.jar"]
