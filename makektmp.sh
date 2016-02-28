#!/bin/bash

# THIS IS ONLY NECESSARY FOR AMIs
# Installing CUDA and other dependencies can lead to a lot of diskspace use in your home directory
# Create a temporty directory to hold some of the non-crucial components of the installation
sudo mkdir /mnt/tmp
sudo chmod 777 /mnt/tmp
sudo rm -rf /tmp
sudo ln -s /mnt/tmp /tmp
