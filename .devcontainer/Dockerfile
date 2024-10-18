# Use the base Ubuntu image for x86 architecture
FROM ubuntu:latest

# Install essential packages for assembly development
RUN apt-get update -y && \
    apt-get install -y \
    nasm \
    binutils \
    clang \
    git \
    bsdmainutils \
    vim \
    wget \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user to avoid permission issues
RUN useradd -m asmuser && \
    echo 'asmuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the non-root user
USER asmuser

# Set working directory for exercises
WORKDIR /exercises

# Ensure the exercises directory is writable and executable
RUN sudo chmod -R ugo+rwX /exercises

# Mount local exercises directory into container
VOLUME [ "/exercises" ]

# Set the location of bash history file
ENV HISTFILE=/.bash_history

# Default command to start an interactive shell
CMD ["/bin/bash"]
