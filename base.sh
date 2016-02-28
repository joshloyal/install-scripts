#!/bin/bash

echo "Installing basic packages"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y build-essential \
                        git \
                        python-pip \
                        python-dev \
                        swig \
                        default-jdk \
                        zip \
                        zlib1g-dev

echo "Installing scientific packages"
sudo apt-get install -y libatlas-base-dev \
                        liblapack-dev \
                        gfortran

echo "Installing pip"
sudo pip install -U pip

echo "Configuring PATH"
mkdir -p $HOME/bin
echo "export PATH=\$HOME/bin:\$PATH" >> $HOME/.bashrc
