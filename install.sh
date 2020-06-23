#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt_install() {
  sudo apt install --yes $*
}

yum_install() {
  yum install -y $*
}

install() {
  os_family=$(awk -F= '/^ID_LIKE=/{print $2}' /etc/os-release)
  case $os_family in
    *debian*) apt_install $*;;
    *fedora*) yum_install $*;;
    *) echo "Error trying to determine os_family or unsupported value $os_family" && exit 1;;
  esac
}

# Install system dependencies
install apt-transport-https build-essential curl ruby ruby-dev ruby-bundler sudo

# Install chef
CHANNEL='stable'
CODENAME=$(grep 'UBUNTU_CODENAME=' /etc/os-release | cut -d'=' -f2)
curl https://packages.chef.io/chef.asc | sudo apt-key add -
echo "deb https://packages.chef.io/repos/apt/${CHANNEL} ${CODENAME} main" > "/etc/apt/sources.list.d/chef-${CHANNEL}.list"
apt update
apt install --yes chef chef-zero

# Install ruby dependencies
gem install bundler
#bundle install

## Validate chef-client is installed (not part of normal ubuntu package)
#if [[ ! -x $(which chef-client) ]]
#then
#  curl --silent -o /usr/local/bin/chef-client https://raw.githubusercontent.com/chef/chef/master/chef-bin/bin/chef-client
#  chmod +x /usr/local/bin/chef-client
#fi
