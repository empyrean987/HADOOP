#
# Cookbook Name:: HADOOP
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user 'hadoop' do
  comment 'the hadoop user'
  home '/home/hadoop'
  shell '/bin/bash'
  password 'hadoop'
end
group 'hadoop-group' do
  action :create
  members 'hadoop'
  append true
end
