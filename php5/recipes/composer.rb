


# Install Composer
#bash "install_composer" do
#     user "root"
#     cwd "/tmp"
#     code <<-EOH
#	   curl -sS https://getcomposer.org/installer | php
#	   chmod 755 composer.phar
#	   mv composer.phar /usr/local/bin/composer
#     EOH
#     not_if "test -f /usr/local/bin/composer"
#end


#Should really keep the composer.phar in the git repo. It simplifies this a lot

remote_file "/usr/local/bin/composer" do
    source 'http://getcomposer.org/composer.phar'
    mode 755
    action :create
    not_if do
      ::File.exist?("/usr/local/bin/composer")
    end
end


# This should be run as part of the deploy process, but needs to set a working directory

#execute "composer install" do
#  command "php composer.phar install && touch /var/log/.php_composer_installed"
#  creates "/var/log/.php_composer_installed"
#  action :run
#end