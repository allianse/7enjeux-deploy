FROM ghcr.io/peergos/web-ui:master
LABEL "language"="java"
LABEL "framework"="peergos"

WORKDIR /app

# Create data directory
RUN mkdir -p /opt/peergos/data

# Expose ports
EXPOSE 8000 4001 5001

# Run the Peergos daemon
CMD ["daemon", "-listen-host", "0.0.0.0", "-public-domain", "7enjeux.zeabur.app", "-public-server", "true", "-announce-ipfs-addresses", "/ip4/0.0.0.0/tcp/4001,/ip4/0.0.0.0/udp/4001/quic-v1", "-log-to-console", "true"]
