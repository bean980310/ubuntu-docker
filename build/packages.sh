#!/usr/bin/env bash
apt update && apt -y full-upgrade
apt install -y \
    build-essential \
    software-properties-common \
    python3-tk \
    python3-dev \
    python3-launchpadlib \
    nodejs \
    npm \
    bash \
    git \
    git-lfs \
    ncdu \
    net-tools \
    openssh-server \
    libglib2.0-0 \
    libsm6 \
    libgl1 \
    libxrender1 \
    libxext6 \
    ffmpeg \
    wget \
    curl \
    psmisc \
    rsync \
    vim \
    zip \
    unzip \
    p7zip-full \
    htop \
    screen \
    tmux \
    bc \
    aria2 \
    cron \
    pkg-config \
    plocate \
    libcairo2-dev \
    libgoogle-perftools4 \
    libtcmalloc-minimal4 \
    apt-transport-https \
    ca-certificates \
    pandoc \
    gcc \
    jq
update-ca-certificates
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs
npm install -g npm@latest
apt clean
rm -rf /var/lib/apt/lists/*
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen