#
# Cookbook: solobook
# Recipe: nvim
#

# Install neovim
case node['platform_family']
when 'debian'
  apt_package 'neovim'
when 'arch'
  pacman_package 'neovim'
end

# Install configuration files

# Setup alternative to use nvim

# Setup $EDITOR?

# Remove regular vim?
