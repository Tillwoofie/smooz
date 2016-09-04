#! /bin/bash

echo "Checking if we are root"
if [ ! $(whoami) == "root" ]
  then
    echo "Please run this script as root or with sudo."
    exit 1
fi

echo "Checking for EPEL repo"
if [ ! $(rpm -qa | grep "epel-release") ] ;
  then
    echo "Installing EPEL repo"
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
fi

echo "Checking for Ansible"
if [ ! $(rpm -qa | grep "ansible") ] ;
  then
    echo "Installing Ansible"
    yum install -y ansible
fi

echo "Running ansible against localhost"
ansible -i 127.0.0.1, -c local ./smooz-setup.yml

rm ./smooz-setup.retry
