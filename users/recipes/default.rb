#
# Cookbook Name:: users
# Recipe:: default
#
#

user node[:user][:name] do
	supports :manage_home => true
	home "/home/#{node[:user][:name]}"
end
'''
directory "/home/#{node[:user][:name]}/.ssh" do
	owner node[:user][:name]
	group node[:user][:name]
	mode 00700
	action :create
end

file "/home/#{node[:user][:name]}/.ssh/authorized_keys" do
	owner node[:user][:name]
	group node[:user][:name]
	content node[:user][:key]
	mode 00644
	action :create
end'''
