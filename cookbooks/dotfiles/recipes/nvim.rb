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

# Install vim-plug
directory wuser_dir('.local/share/nvim/site/autoload') do
  recursive true
end

remote_file wuser_dir('.local/share/nvim/site/autoload/plug.vim') do
  source 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
end

# Validate config dir exists
directory wuser_dir('.config/nvim') do
  recursive true
end

# Install configuration files
cookbook_file wuser_dir('.config/nvim/init.vim') do
  source 'nvim/init.vim'
end

# Setup alternative to use nvim

# Setup $EDITOR?

# Remove regular vim?
