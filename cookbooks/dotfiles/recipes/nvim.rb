#
# Cookbook: solobook
# Recipe: nvim
#

# Install neovim
case node['platform_family']
when 'debian'
  apt_repository 'neovim' do
    uri 'ppa:neovim-ppa/stable'
  end
  apt_package 'neovim'
when 'arch'
  pacman_package 'neovim'
end

# Install configuration files
cookbook_file wuser_dir('.config/nvim/init.vim') do
  source 'nvim/init.vim'
end

# Setup alternative to use nvim

# Setup $EDITOR?

# Remove regular vim?
