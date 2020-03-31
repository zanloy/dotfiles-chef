#
# Cookbook: solobook
# Recipe: git
#

include_recipe 'git'

# Use color because purdy
# TODO: Move these to a databag(?)
{
  'branch': 'auto',
  'diff': 'auto',
  'status': 'auto',
  'showbranch': 'auto',
  'ui': 'true',
}.each do |k, v|
  git_config "color.#{k}" do
    value v
  end
end

{
  'branch': {
    'current': 'yellow reverse',
    'local': 'yellow',
    'remote': 'green'
  },
  'diff': {
    'meta': 'yellow bold',
    'frag': 'magenta bold',
    'old': 'red bold',
    'new': 'green bold'
  },
  'status': {
    'added': 'yellow',
    'changed': 'green',
    'untracked': 'cyan',
  }
}.each do |name, v|
  v.each do |status, color|
    git_config "color.#{name}.#{status}" do
      value color
    end
  end
end
