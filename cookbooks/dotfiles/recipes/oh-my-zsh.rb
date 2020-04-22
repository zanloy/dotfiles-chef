#
# Cookbook: dotfiles
# Recipe: oh-my-zsh
#

username = current_user
plugin_list = %w[
  alias-finder
  bundler
  colored-man-pages
  colorize
  command-not-found
  common-aliases
  fasd
  git
  github
  gitignore
  history
  man
  nmap
  rake
  rbenv
  ruby
  thefuck
  thor
  tmux
  vi-mode
  web-search
  zsh-interactive-cd
  zsh-navigation-tools
]
plugin_extras = %w[ansible aws docker emoji helm mosh rails redis-cli]
plugin_mac = %w[iterm2 osx]
oh_my_zsh_user username do
  plugins plugin_list
  theme 'powerlevel10k'
end

# Install powerlevel10k theme
git 'install_powerlevel10k' do
  depth 1
  destination wuser_dir('.oh-my-zsh/themes/powerlevel10k')
  repository 'https://github.com/romkatv/powerlevel10k.git'
end
