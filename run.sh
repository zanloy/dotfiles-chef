#!/bin/bash

chef-client --chef-license accept-silent --local-mode --config solo.rb --override-runlist dotfiles::default
