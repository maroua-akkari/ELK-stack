#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe "java"
include_recipe 'elasticsearch'
include_recipe 'kibana::default'

apt_update 'update_sources' do
  action :update
end
<<<<<<< HEAD
#
=======

>>>>>>> 37aab4795dcd643c1f5024a757e032acc6a0af29
bash '' do
  code 'sudo apt-get -y install logstash'
end

template "/etc/logstash/conf.d/02-beats-input.conf" do
  owner "root"
  group "root"
  mode "0777"
  source "02-beats-input.conf.erb"
end

template "/etc/logstash/conf.d/10-syslog-filter.conf" do
  owner "root"
  group "root"
  mode "0777"
  source "10-syslog-filter.conf.erb"
end

template "/etc/logstash/conf.d/30-elasticsearch-output.conf" do
  owner "root"
  group "root"
  mode "0777"
  source "30-elasticsearch-output.conf.erb"
end

bash '' do
  code 'sudo service logstash restart'
end

bash '' do
  code 'sudo systemctl enable logstash'
end

bash '' do
  code 'sudo apt-get install filebeat'
end

<<<<<<< HEAD
# template "/etc/filebeat/filebeat.yml" do
#   owner "root"
#   group "root"
#   mode "0777"
#   source "filebeat.yml"
# end
=======
template "/etc/filebeat/filebeat.yml" do
  owner "root"
  group "root"
  mode "0755"
  source "filebeat.yml.erb"
end

template "/var/log/test.log" do
  owner "root"
  group "root"
  mode "0777"
  source "test.log"
end
>>>>>>> 37aab4795dcd643c1f5024a757e032acc6a0af29

template "/var/log/test.log" do
  owner "root"
  group "root"
  mode "0777"
  source "test.log.erb"
end

bash '' do
  code 'sudo service filebeat start'
end

bash '' do
  code 'sudo systemctl enable filebeat'
end
