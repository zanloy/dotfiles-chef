#!/bin/bash

export CHEF_LICENSE='accept-silent'
chef-client --local-mode --config solo.rb --override-runlist dotfiles::default
