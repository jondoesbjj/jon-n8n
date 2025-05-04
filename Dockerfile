# ./Dockerfile
FROM docker.io/n8nio/n8n:latest

# Install Python 3 and pip inside the Alpine-based image
USER root
RUN apk add --no-cache python3 py3-pip   # Alpine package repos include python3 & pip:contentReference[oaicite:2]{index=2}

# Switch back to the default n8n user
USER node

# Optional: make pipx available for isolated CLI tools
RUN python3 -m pip install --user pipx && \
    pipx ensurepath

# Expose pipx path
ENV PATH="/home/node/.local/bin:${PATH}"
