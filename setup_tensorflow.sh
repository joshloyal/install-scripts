#!/bin/bash

# THIS IS ONLY NECESSARY FOR AMIs
# Installing CUDA and other dependencies can lead to a lot of diskspace use in your home directory
# Create a temporty directory to hold some of the non-crucial components of the installation
sudo mkdir /mnt/tmp
sudo chmod 777 /mnt/tmp
sudo rm -rf /tmp
sudo ln -s /mnt/tmp /tmp

# Install Java 8
cd /mnt/tmp
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

# Install Bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.2.0/bazel-0.2.0-installer-linux-x86_64.sh
chmod a+x bazel-0.2.0-installer-linux-x86_64.sh
sudo ./bazel-0.2.0-installer-linux-x86_64.sh
rm ./bazel-0.2.0-installer-linux-x86_64.sh

# Install TensorFlow
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
./configure

# build python package
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip install /tmp/tensorflow_pkg/tensorflow-0.7.1-py2-none-linux_x86_64.whl

