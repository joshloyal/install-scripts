#!/bin/bash

# Install Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

# Install Bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.2.0/bazel-0.2.0-installer-linux-x86_64.sh
chmod a+x bazel-0.2.0-installer-linux-x86_64.sh
mkdir -p $HOME/bin
sudo ./bazel-0.2.0-installer-linux-x86_64.sh --user && rm bazel-0.2.0-installer-linux-x86_64.sh
sudo chown -R $(whoami) $HOME/.cache/bazel  # for some reason this doesn't have appropriate permissions
export PATH=$HOME/bin:$PATH


# Install TensorFlow
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
./configure

# build python package
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip install /tmp/tensorflow_pkg/tensorflow-0.7.1-py2-none-linux_x86_64.whl
