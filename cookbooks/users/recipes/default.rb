#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

search(:users, "*:*").each do |user_data|
  user user_data['id'] do
    comment user_data['comment']
    uid user_data['uid']
    gid user_data['gid']
    home user_data['home']
    shell user_data['shell']
  end

  if user_data['home'] != "/dev/null"
    directory user_data['home'] do
      owner user_data['id']
      group user_data['gid']
      mode "0755"
    end
    directory "#{user_data['home']}/.ssh" do
      owner user_data['id']
      group user_data['gid']
      mode "0700"
    end
  end

  if user_data['ssh_keys']
    template "#{user_data['home']}/.ssh/authorized_keys" do
      source "authorized_keys.erb"
      owner user_data['id']
      group user_data['gid']
      mode "0600"
      variables :ssh_keys => user_data['ssh_keys']
    end
  end
end

include_recipe "users::group"
