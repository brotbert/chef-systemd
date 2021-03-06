#
# Cookbook Name:: systemd
# Recipe:: hostname
#
# Copyright 2015 The Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

path = '/etc/hostname'
hostname = node['systemd']['hostname']

file path do
  content hostname
  not_if { hostname.nil? }
end

execute "hostnamectl set-hostname #{hostname}" do
  action :nothing
  subscribes :run, "file[#{path}]", :immediately
end

service 'systemd-hostnamed' do
  action :enable
  subscribes :restart, "file[#{path}]", :immediately
end
