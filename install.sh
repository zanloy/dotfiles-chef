#!/bin/bash

bundle install
if [[ ! -x $(which chef-client) ]]
then
  curl --silent -o /usr/local/bin/chef-client https://raw.githubusercontent.com/chef/chef/master/chef-bin/bin/chef-client
  chmod +x /usr/local/bin/chef-client
fi
