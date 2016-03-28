require 'docker'
require 'serverspec'

### docker
set :backend, :docker
set :docker_container, ENV['KITCHEN_CONTAINER_ID']

### ssh
=begin
set :backend, :ssh

options = Net::SSH::Config.for(host)
options[:host_name] = ENV['KITCHEN_HOSTNAME']
options[:user]      = ENV['KITCHEN_USERNAME']
options[:port]      = ENV['KITCHEN_PORT']
options[:keys]      = ENV['KITCHEN_SSH_KEY']

set :host,        options[:host_name]
set :ssh_options, options
set :env, :LANG => 'C', :LC_ALL => 'C'
=end
