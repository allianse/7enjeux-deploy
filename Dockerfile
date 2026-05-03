FROM ghcr.io/peergos/web-ui:master

LABEL "language"="java"

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
