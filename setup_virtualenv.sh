#!/bin/bash

sudo pip install virtualenv
sudo pip install virtualenvwrapper

echo "export WORKON_HOME=$HOME/.virtualenvs" >> $HOME/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> $HOME/.bashrc

source $HOME/.bashrc
