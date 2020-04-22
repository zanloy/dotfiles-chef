#
# Cookbook:: solobook
# Recipe:: default
#

default_recipes = %w[fasd git nvim oh-my-zsh ruby]

default_recipes.each do |recipe|
  include_recipe "dotfiles::#{recipe}"
end
