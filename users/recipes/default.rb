#
# Cookbook Name:: users
# Recipe:: default
#
#

user node[:user][:name] do
	supports :manage_home => true
	home "/home/#{node[:user][:name]}"
end

unless Dir.exist? "/home/#{node[:user][:name]}/.ssh"
	directory "/home/#{node[:user][:name]}/.ssh" do
		owner node[:user][:name]
		group node[:user][:name]
		mode "0700"
	end
	
	file "/home/#{node[:user][:name]}/.ssh/authorized_keys" do
		owner node[:user][:name]
		group node[:user][:name]
		content node[:user][:key]
		action :create_if_missing
	end
end
