#
# Cookbook Name:: Pod Point
# Recipe:: setup
include_recipe "apt"


# add repository for PHP 5.4
apt_repository "php54" do
  uri "http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "E5267A6C"
end
 
# update apt info
execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
end
 
# update PHP to version 5.4 and add necessary packages
%w{php5 php5-common php-apc php5-memcached php5-memcache php5-intl php5-mysqlnd php5-curl php5-xsl php5-sqlite php5-gd php5-cli php5-mcrypt}.each do |pkg|
  package pkg do
    action :install
  end
end


file "/etc/php5/cli/conf.d/sasl.ini" do
  action :delete
end
