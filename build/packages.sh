#!/usr/bin/env bash
set -e

apt-get update
apt-get install -y \
    build-essential \
    pandoc \
    gcc \
    g++ \
    software-properties-common \
    python3-tk \
    python3-dev \
    python3-launchpadlib \
    bash \
    git \
    git-lfs \
    net-tools \
    netcat-openbsd \
    openssh-server \
    libglib2.0-0 \
    libsm6 \
    libgl1 \
    libxrender1 \
    libxext6 \
    ffmpeg \
    wget \
    curl \
    p7zip-full \
    pkg-config \
    libcairo2-dev \
    libgoogle-perftools4 \
    libtcmalloc-minimal4 \
    ca-certificates \
    jq
update-ca-certificates
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
npm install -g npm@latest
apt-get clean
rm -rf /var/lib/apt/lists/*
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen