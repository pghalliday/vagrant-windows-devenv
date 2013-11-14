user node[:vagrant_windows_devenv][:user] do
  supports :manage_home => true
  home node[:vagrant_windows_devenv][:home]
end

include_recipe "git"

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby node[:vagrant_windows_devenv][:ruby_version]

rbenv_gem "bundler" do
  ruby_version node[:vagrant_windows_devenv][:ruby_version]
end

magic_shell_environment 'EDITOR' do
  value 'vim'
end

# set the default ruby version
magic_shell_environment 'RBENV_VERSION' do
  value node[:vagrant_windows_devenv][:ruby_version]
end

# This works around the company firewall which
# blocks the default port for the git protocol
bash "override git urls with https" do
  code <<-EOH
    su -l #{node[:vagrant_windows_devenv][:user]} -c "git config --global url.\"https://\".insteadOf git://"
    EOH
end
