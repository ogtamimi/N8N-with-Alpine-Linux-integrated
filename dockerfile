# Use the official n8n image as the base. This guarantees all n8n dependencies are correct.
# The base image is Alpine Linux, which uses 'apk' as its package manager.
FROM n8nio/n8n:latest

# Switch to the root user to install system packages and configure sudo.
USER root

# Install necessary packages for Kali-like functionality and the 'sudo' utility.
# CRITICAL FIX: Using 'apk' package manager.
RUN apk update \
    && apk add --no-cache \
        sudo \
        curl \
        wget \
        git \
        net-tools \
        iputils \
        python3 \
        py3-pip \
        gnupg \
        dirmngr \
    && rm -rf /var/cache/apk/*

# The default non-root user in the official n8n image is 'node'.
ENV N8N_USER=node

# CRITICAL STEP: Configure the 'node' user for passwordless sudo access.
# This is the mechanism that grants the AI Agent node root privileges.
RUN echo "${N8N_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/n8n-sudo \
    && chmod 0440 /etc/sudoers.d/n8n-sudo

# Switch back to the non-root user 'node' for security during runtime.
USER ${N8N_USER}

# The rest of the configuration (WORKDIR, EXPOSE, CMD) is inherited from the base image.