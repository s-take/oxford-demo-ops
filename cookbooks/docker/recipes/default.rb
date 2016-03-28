#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template "/etc/yum.repos.d/docker.repo" do
  owner "root"
  group "root"
  mode "0644"
end

package "docker-engine" do
  action :install
end

execute "systemctl daemon-reload" do
  action :nothing
end

service "docker" do
  action :enable
  supports :start => true, :status => true, :restart => true, :reload => true
end

template "/etc/systemd/system/docker.service" do
  owner "root"
  group "root"
  mode "0644"
  notifies :run, 'execute[systemctl deamon-reload]',:immediately
  notifies :restart, 'service[docker]'
end
