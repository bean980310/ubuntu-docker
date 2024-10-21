#!/usr/bin/env bash
set -e

pip3 install -U --no-cache-dir jupyter \
    jupyterlab \
    jupyterlab_widgets \
    ipykernel \
    ipywidgets \
    tensorflow \
    tensorboard \
    tensorboardx \
    onnxruntime-gpu \
    onnx

wget https://dot.net/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --channel 8.0 --runtime aspnetcore
./dotnet-install.sh --channel 8.0

# curl -fsSL https://code-server.dev/install.sh | sh

# code-server --install-extension /tmp/RSIP-Vision.nvidia-smi-plus-1.0.1.vsix
# code-server --install-extension /tmp/vscode-ext.sync-rsync-0.36.0.vsix

# code-server --install-extension ms-python.python
# code-server --install-extension ms-toolsai.jupyter
# code-server --install-extension ms-toolsai.vscode-jupyter-powertoys

python3 -m ipykernel install --name "python3" --display-name "Python 3"

pip3 cache purge
