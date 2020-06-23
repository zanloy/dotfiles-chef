#
# Cookbook:: solobook
# Recipe:: default
#

# Currently 'ruby' causes an error that I can't figure out why
default_recipes = %w[fasd git nvim oh-my-zsh]

default_recipes.each do |recipe|
  include_recipe "dotfiles::#{recipe}"
end
