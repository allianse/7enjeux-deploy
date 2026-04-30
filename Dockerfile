FROM  ghcr.io/peergos/web-ui:master

# Set environment variables
ENV PEERGOS_PATH=/data
ENV PEERGOS_PORT=8000

# Create data directories
RUN mkdir -p /data

# Expose ports
# 8000 - Web interface
# 4001 - IPFS swarm
# 5001 - IPFS API
EXPOSE 8000 4001 5001

# Start Peergos
CMD ["java", "-jar", "/app/peergos.jar", "-PEERGOS_PATH", "/data"]

FROM openjdk:17-slim

LABEL "language"="java"

WORKDIR /app

# Install Apache Ant
RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

# Copy your project files
COPY . .

# Build with Ant (adjust the target as needed for your project)
RUN ant build

# Expose port 8000 for your application
EXPOSE 8000

# Start your application (adjust the command based on your project)
CMD ["java", "-jar", "dist/app.jar"]
