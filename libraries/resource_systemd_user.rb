#
# Cookbook Name:: systemd
# Library:: Chef::Resource::SystemdUser
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

require_relative 'resource_systemd_util'
require_relative 'systemd_user'

class Chef::Resource
  class SystemdUser < Chef::Resource::SystemdUtil
    self.resource_name = :systemd_user
    provides :systemd_user

    def conf_type(_ = nil)
      :user
    end

    def label(_ = nil)
      'Manager'
    end

    option_attributes Systemd::User::OPTIONS
  end
end
