#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe "java"
include_recipe 'elasticsearch'
include_recipe 'simple-logstash'
include_recipe 'kibana::default'




apt_update 'update_sources' do
  action :update
end


bash '' do
  code 'curl -XGET --globoff "http://localhost:9200/logstash/typename/optionalUniqueId" -d '{ "field" : "value" }''
end
