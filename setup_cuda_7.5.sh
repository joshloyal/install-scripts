#!/bin/bash

# This is necessary for installation to work on amazon AMIs
# The amazon machines don't come with all the nvidia drivers
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y linux-image-extra-`uname -r`
sudo apt-get update

# Install CUDA 7 (must use cuda 7.0 on amazon ami...)
wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb && rm cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo apt-get update -y
sudo apt-get install cuda -y

# Install cuDNN (note theano needs cudnn v3 (7.0) but tensorflow only supports v2 (6.5))
CUDNN_URL="/path/to/cudnn/here"
wget $CUDNN_URL -O cudnn-linux-x64.tgz
mkdir -p cudnn && tar -zvxf cudnn-linux-x64.tgz -C cudnn --strip-components 1 && rm cudnn-linux-x64.tgz
sudo cp cudnn/include/cudnn.h /usr/local/cuda/include/
sudo cp cudnn/lib64/libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
rm -rf cudnn/

# setup environmental variables for CUDA
echo "export CUDA_HOME=/usr/local/cuda" >> $HOME/.bashrc
echo "export CUDA_ROOT=/usr/local/cuda" >> $HOME/.bashrc
echo "export PATH=$PATH:/usr/local/cuda/bin" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64" >> $HOME/.bashrc

# Reboot for CUDA
sudo reboot

