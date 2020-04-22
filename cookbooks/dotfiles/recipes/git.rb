#
# Cookbook: solobook
# Recipe: git
#

include_recipe 'git'

# TODO: Move these to a databag(?)
aliases = data_bag_item('git', 'aliases')

# Use color because purdy
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

# Warn on extra whitespace
git_config 'core.whitespace' do
  value 'fix,-indent-with-non-tab,trailing-space,cr-at-eol'
end

# Do not warn on whitespace during apply(?)
git_config 'apply.whitespace' do
  value 'nowarn'
end

git_config 'branch.autosetuprebase' do
  value 'always'
end

git_config 'rerere.enabled' do
  value '1'
end

# Use short log dates
git_config 'log.date' do
  value 'short'
end

# Add aliases
aliases.each do |k, v|
  git_config "alias.#{k}" do
    value v
  end
end

git_config 'format.pretty' do
  value '%C(yellow)%h%Creset %C(magenta)%cd%Creset %d %s'
end

# Setup user info
git_config 'user.name' do
  value 'Zan Loy'
end

git_config 'user.email' do
  value 'zan.loy@gmail.com'
end

# Setup some shorthands for common git sites
# eg: git clone gh:zanloy/dotfiles.git
git_config 'url."https://github.com/".insteadOf' do
  value 'gh:'
end

git_config 'url."https://gist.github.com/".insteadOf' do
  value 'gist:'
end

git_config 'url."https://bitbucket.org/".insteadOf' do
  value 'bb:'
end

# Setup GitHub configuration
git_config 'github.user' do
  value 'zanloy'
end
# TODO: Put token in encrypted databag and implement
#git_config 'github.token' do
#  value 'abc'
#end

git_config 'push.default' do
  value 'simple'
end
