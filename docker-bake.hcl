variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "bean980310"
}

variable "RELEASE" {
    default = "1.1.0"
}

group "default" {
    targets=[
        "cu118-torch241-xformers0028post1",
        "cu121-torch241-xformers0028post1",
        "cu124-torch241-xformers0028post1",
    ]
}

target "cu118-torch241-xformers0028post1" {
    dockerfile="./Dockerfile"
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda12.6.2-cudnn8-devel-torch2.4.1"]
    args={
        BASE_IMAGE = "nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="11.8"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu118"
        TORCH_VERSION="2.4.1+cu118"
        XFORMERS_VERSION="0.0.28.post1"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}

target "cu121-torch241-xformers0028post1" {
    dockerfile="./Dockerfile"
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda12.6.2-cudnn8-devel-torch2.4.1"]
    args={
        BASE_IMAGE = "nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="12.1"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu121"
        TORCH_VERSION="2.4.1+cu121"
        XFORMERS_VERSION="0.0.28.post1"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}

target "cu124-torch241-xformers0028post1" {
    dockerfile="./Dockerfile"
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda12.6.2-cudnn8-devel-torch2.4.1"]
    args={
        BASE_IMAGE = "nvidia/cuda:12.6.2-cudnn-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="12.4"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu124"
        TORCH_VERSION="2.4.1+cu124"
        XFORMERS_VERSION="0.0.28.post1"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}