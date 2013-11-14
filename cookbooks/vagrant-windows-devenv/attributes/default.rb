default[:vagrant_windows_devenv][:user] = "vagrant"
default[:vagrant_windows_devenv][:home] = "/home/vagrant"
default[:vagrant_windows_devenv][:ruby_version] = "1.9.3-p448"

# This works around the company firewall which
# blocks the default port for the git protocol
default[:rbenv][:git_repository] = "https://github.com/sstephenson/rbenv.git"
default[:ruby_build][:git_repository] = "https://github.com/sstephenson/ruby-build.git"
