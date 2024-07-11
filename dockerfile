ARG BASE_IMAGE
FROM ${BASE_IMAGE} as base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Seoul \
    PYTHONUNBUFFERED=1 \
    SHELL=/bin/bash

# Install Ubuntu packages
COPY --chmod=755 build/packages.sh /packages.sh
RUN /packages.sh && rm /packages.sh

# Set Python
RUN ln -s /usr/bin/python3.10 /usr/bin/python

# Install Torch and xformers
ARG INDEX_URL
ARG TORCH_VERSION
ARG XFORMERS_VERSION

RUN pip3 install --no-cache-dir torch==${TORCH_VERSION} torchvision torchaudio --index-url ${INDEX_URL} && \
    pip3 install --no-cache-dir xformers==${XFORMERS_VERSION} --index-url ${INDEX_URL} && \
    pip3 install tensorflow[and-cuda]

# Stage 2: Install applications
# FROM base as setup

# Install apps
# ARG RUNPODCTL_VERSION
# ENV RUNPODCTL_VERSION=${RUNPODCTL_VERSION}
# COPY code-server/vsix/*.vsix /tmp/
# COPY code-server/settings.json /root/.local/share/code-server/User/settings.json
# COPY --chmod=755 build/apps.sh /apps.sh
# RUN /apps.sh && rm /apps.sh

# Remove existing SSH host keys
RUN rm -f /etc/ssh/ssh_host_*

# NGINX Proxy
# COPY nginx/502.html /usr/share/nginx/html/502.html

# Copy the scripts
# WORKDIR /
# COPY --chmod=755 scripts/* ./
# RUN mv /manage_venv.sh /usr/local/bin/manage_venv

# Start the container
# ARG REQUIRED_CUDA_VERSION
# ENV REQUIRED_CUDA_VERSION=${REQUIRED_CUDA_VERSION}
# SHELL ["/bin/bash", "--login", "-c"]
# CMD [ "/start.sh" ]
CMD ["bin/bash"]