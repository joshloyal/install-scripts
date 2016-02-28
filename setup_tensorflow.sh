#!/bin/bash

# Install Java 8
cd /tmp
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

# Install Bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.2.0/bazel-0.2.0-installer-linux-x86_64.sh
chmod a+x bazel-0.2.0-installer-linux-x86_64.sh
mkdir -p $HOME/bin
sudo ./bazel-0.2.0-installer-linux-x86_64.sh --user
export PATH=$HOME/bin:$PATH
rm ./bazel-0.2.0-installer-linux-x86_64.sh

# Install TensorFlow
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
./configure

# build python package
sudo bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
sudo bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip install /tmp/tensorflow_pkg/tensorflow-0.7.1-py2-none-linux_x86_64.whl

