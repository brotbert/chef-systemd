#
# Cookbook Name:: systemd
# Library:: Chef::Resource::SystemdTimesyncd
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
#

require_relative 'resource_systemd_daemon'
require_relative 'systemd_timesyncd'

class Chef::Resource
  class SystemdTimesyncd < Chef::Resource::SystemdDaemon
    self.resource_name = :systemd_timesyncd
    provides :systemd_timesyncd

    def conf_type(_ = nil)
      :timesyncd
    end

    def label(_ = nil)
      'Time'
    end

    option_attributes Systemd::Timesyncd::OPTIONS
  end
end
