ARG BASE_IMAGE
FROM ${BASE_IMAGE} AS base

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
    pip3 install -U huggingface huggingface_hub[cli] && \
    pip3 cache purge

# Install Ubuntu apps
COPY --chmod=755 build/apps.sh /apps.sh
RUN /apps.sh && rm /apps.sh

# Remove existing SSH host keys
RUN rm -f /etc/ssh/ssh_host_*

# Start the container
CMD ["bin/bash"]