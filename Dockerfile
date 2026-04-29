FROM peergos/peergos:latest

# Set environment variables
ENV PEERGOS_PATH=/data
ENV PEERGOS_PORT=7777

# Create data directories
RUN mkdir -p /data

# Expose ports
# 8000 - Web interface
# 4001 - IPFS swarm
# 5001 - IPFS API
EXPOSE 7777 4001 5001

# Start Peergos
CMD ["java", "-jar", "/app/peergos.jar", "-PEERGOS_PATH", "/data"]
