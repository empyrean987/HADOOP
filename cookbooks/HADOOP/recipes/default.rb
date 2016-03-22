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

package 'java-1.7.0-openjdk-devel.x86_64' do
  action :install
end

rpm_package "cloudera" do
  source "http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm"
  action :install
end

package 'hadoop-conf-pseudo' do
  action :install
end

execute 'no tty' do
  command "sed -i '/^Defaults    requiretty/s/^/#/g' /etc/sudoers"
end

#execute 'format nodes' do
  #environment 'JAVA_HOME' => "/home/#{app_user}"
  #command 'sudo -u hdfs hdfs namenode -format'
#end

service 'hadoop-hdfs-datanode' do
  action :start
end

service 'hadoop-hdfs-namenode' do
  action :start
end

service 'hadoop-hdfs-secondarynamenode' do
  action :start
end

#execute 'init hdfs' do
#  command "/usr/lib/hadoop/libexec/init-hdfs.sh"
#end

service 'hadoop-yarn-resourcemanager' do
  action :start
end

service 'hadoop-yarn-nodemanager' do 
  action :start
end

service 'hadoop-mapreduce-historyserver' do
  action :start
end
