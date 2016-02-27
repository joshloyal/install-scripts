#!/bin/bash

# Install CUDA 7
wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo apt-get update -y
sudo apt-get install cuda -y
rm cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb

# Install cuDNN
CUDNN_URL="/path/to/cudnn/here"
wget $CUDNN_URL -O cudnn-6.5-linux-x64-v2.tgz
tar -zvxf cudnn-6.5-linux-x64-v2.tgz && rm cudnn-6.5-linux-x64-v2.tgz
sudo cp cudnn-6.5-linux-x64-v2/cudnn.h /usr/local/cuda-7.5/include/
sudo cp cudnn-6.5-linux-x64-v2/libcudnn* /usr/local/cuda-7.5/lib64/
sudo chmod a+r /usr/local/cuda-7.5/lib64/libcudnn*

# Reboot for CUDA
sudo reboot

# setup environmental variables for CUDA
export CUDA_HOME=/usr/local/cuda-7.5
export CUDA_ROOT=$CUDA_HOME
export PATH=$PATH:$CUDA_ROOT/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64
