#
# Cookbook: dotfiles
# Recipe: fasd
#

case node['platform_family']
when 'arch'
  pacman_package 'fasd'
when 'debian'
  apt_repository 'fasd' do
    uri 'ppa:aacebedo/fasd'
  end
  apt_package 'fasd'
end
