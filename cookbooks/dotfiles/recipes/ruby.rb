#
# Cookbook: solobook
# Recipe: ruby
#

version = '2.6.5' # TODO: Put in databag(?)
username = current_user

# Install all the config files in ~/.*
get_files_for('ruby').each do |file|
  filename = File.basename(file[:path])

  cookbook_file wuser_dir(".#{filename}") do
    source file[:path].delete_prefix('files/')
  end
end

# Install rbenv
rbenv_user_install username do
  update_rbenv false
end

# Install ruby-build plugin
rbenv_plugin 'ruby-build' do
  git_url 'https://github.com/rbenv/ruby-build.git'
  user username
end

# Install Ruby version
rbenv_ruby version do
  user username
end

# TODO: Add the required setup steps for bash and zsh
