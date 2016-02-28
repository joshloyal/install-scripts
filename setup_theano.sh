#! /bin/bash

# install theano
pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git#egg=theano

# install openblas
sudo apt-get remove libopenblas-base -y
cd $HOME
git clone git://github.com/xianyi/OpenBLAS
cd OpenBLAS
make FC=gfortran

