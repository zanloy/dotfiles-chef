# Get the current user
def current_user
  require 'etc'
  Etc.getpwuid['name']
end

# Always provide user dir, even if sudo'ed
def wuser_dir(str = '.')
  File.join(Dir.home, str)
end

# Use when sudo'ed
def root_dir(str = '')
  File.join('/root', str)
end

# Get list of files in a files/subdir
def get_files_for(specificly)
  file_list = run_context.cookbook_collection[:dotfiles].files_for('files')
  file_list.each_with_object([]) do |file, result|
    result << file if file['specificity'] == specificly
  end
end

def deb_list_install(list)
  list.each do |pkg|
    Chef::Log.fatal(pkg)
    apt_package pkg do
      action :install
    end
  end
end

def pacman_list_install(list)
  list.each do |pkg|
    Chef::Log.fatal(pkg)
    pacman_package pkg do
      action :install
    end
  end
end
