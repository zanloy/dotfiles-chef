#!/bin/bash

# Verify we are not root.
if [[ $(id -u) -eq 0 ]];
then
  echo 'This script should not be run as root. It will use sudo for necessary steps.'
  exit 1
fi

exit 0
install() {
  if [[ ! -x $(which "$1") ]]
  then
    echo "$1 is not currently installed. Installing..."
    sudo apt install -y ${2:-$1} || exit 1
  fi
}

install curl
install bundler ruby-bundler

bundle install
if [[ ! -x $(which chef-client) ]]
then
  curl --silent -o /usr/local/bin/chef-client https://raw.githubusercontent.com/chef/chef/master/chef-bin/bin/chef-client
  chmod +x /usr/local/bin/chef-client
fi
