# ./Dockerfile
FROM docker.io/n8nio/n8n:latest

# Install Python 3 and pip inside the Alpine-based image
USER root
RUN apk add --no-cache python3 py3-pip

# Switch back to the default n8n user
USER node
RUN python3 -m pip install --user --break-system-packages pipx

# Add the path of the pipx installation to PATH
ENV PATH="/home/node/.local/bin:$PATH"
