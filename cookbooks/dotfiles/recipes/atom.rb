#
# Cookbook: solobook
# Recipe: atom
#

# Install Atom
case node['platform_family']
when 'debian'
  apt_package 'atom'
when 'arch'
  pacman_package 'atom'
end

# Install Atom packages
execute 'Atom: Install basics' do
  command 'platformio-ide-terminal vim-mode-plus'
  live_stream true
end
