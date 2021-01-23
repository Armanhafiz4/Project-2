#!/bin/bash

#Install Ansible
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip3 install --user ansible
cd Codes/Ansible 
/home/jenkins/.local/bin/ansible-playbook -i inventory playbook.yaml
