FROM ghcr.io/peergos/web-ui:master

# Set environment variables
ENV PEERGOS_PATH=data
ENV PEERGOS_PORT=8000

# Create data directories
RUN mkdir -p /opt/peergos/data

# Expose ports
# 8000 - Web interface
# 4001 - IPFS swarm
# 5001 - IPFS API
EXPOSE 7777 8000 4001 5001

# Start Peergos
ENTRYPOINT ["java", "-jar", "/app/peergos.jar"]
CMD ["-PEERGOS_PATH", "/data"]

# xdg-open
RUN apt-get update && apt-get install -y xdg-utils
