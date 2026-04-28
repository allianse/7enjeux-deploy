FROM ghcr.io/peergos/web-ui:master

# Set environment variables
ENV PEERGOS_PATH=/data
ENV PEERGOS_PORT=80

# Create data directories
RUN mkdir -p /data

# Expose ports
# 8000 - Web interface
# 4001 - IPFS swarm
# 5001 - IPFS API
EXPOSE 3000 8080 8000 4001 5001 443 80

# Start Peergos
CMD ["java", "-jar", "/app/peergos.jar", "-PEERGOS_PATH", "/data"]
