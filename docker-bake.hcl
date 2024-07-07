variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "bean980310"
}

variable "RELEASE" {
    default = "1.0.0"
}

group "default" {
    targets=[
        "cu118-torch212",
        "cu121-torch212",
        "cu121-torch222",
        "cu121-torch230"
    ]
}

target "cu118-torch212" {
    dockerfile=./dockerfile
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda11.8.0-torch2.1.2"]
    args={
        BASE_IMAGE = "nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="11.8"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu118"
        TORCH_VERSION="2.1.2"
        TORCHVISION_VERSION="0.16.2"
        XFORMERS_VERSION="0.0.23.post1+cu118"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}

target "cu121-torch212" {
    dockerfile=./dockerfile
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda12.1.1-torch2.1.2"]
    args={
        BASE_IMAGE = "nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="12.1"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu121"
        TORCH_VERSION="2.1.2"
        TORCHVISION_VERSION="0.16.2"
        XFORMERS_VERSION="0.0.23.post1+cu121"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}

target "cu121-torch222" {
    dockerfile=./dockerfile
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda12.1.1-torch2.2.2"]
    args={
        BASE_IMAGE = "nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="12.1"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu121"
        TORCH_VERSION="2.2.2"
        TORCHVISION_VERSION="0.17.2"
        XFORMERS_VERSION="0.0.25.post1"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}

target "cu121-torch222" {
    dockerfile=./dockerfile
    tags=["${REGISTRY}/${REGISTRY_USER}/ubuntu-docker:${RELEASE}-cuda12.1.1-torch2.3.0"]
    args={
        BASE_IMAGE = "nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04"
        REQUIRED_CUDA_VERSION="12.1"
        RELEASE="$RELEASE"
        INDEX_URL="https://download.pytorch.org/whl/cu121"
        TORCH_VERSION="2.3.0"
        TORCHVISION_VERSION="0.18.0"
        XFORMERS_VERSION="0.0.26.post1"
    }
    platforms=["linux/amd64"]
    annotations=["org.opencontainers.image.authors=${REGISTRY_USER}"]
}