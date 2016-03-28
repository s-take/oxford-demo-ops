#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template "/etc/yum.repos.d/nginx.repo" do
  owner "root"
  group "root"
  mode "0644"
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable]
  supports :start => true, :status => true, :restart => true, :reload => true
end

template "/etc/nginx/conf.d/server.conf" do
  owner "root"
  group "root"
  mode "0644"
  notifies :start, "service[nginx]"
  notifies :reload, "service[nginx]"
end
