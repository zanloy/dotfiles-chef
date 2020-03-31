#
# Cookbook:: solobook
# Recipe:: default
#

default_recipes = %w[git nvim ruby]

default_recipes.each do |recipe|
  include_recipe "dotfiles::#{recipe}"
end
