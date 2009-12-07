set :stages, %w(staging production)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

set :application, "wi"
#set :user, 'withit_prod'
#set :svn_path, 'wi'
set :use_sudo, false
set :vhost,  "wi.com.au"
role :app, "203.145.48.37"
role :web, "203.145.48.37"
role :db,  "203.145.48.37", :primary => true
set :repository,  "git@github.com:withit/wi.git"
set :deploy_to, "/var/www/vhosts/#{vhost}/httpdocs/apps/#{application}"

set :scm, :git
set :deploy_via, :copy
set :copy_compression, :gzip

namespace :mod_rails do
  desc "Restart the application altering tmp/restart.txt for mod_rails."
  task :restart, :roles => :app do
    run "touch  #{release_path}/tmp/restart.txt"
  end
end
  
namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end

task :after_update_code, :roles => :app do
  desc "symlink current to rails folder"
  run "rm -f /var/www/vhosts/#{vhost}/httpdocs/rails"
  run "rm -f /var/www/vhosts/#{vhost}/httpdocs/public"
  run "ln -s /var/www/vhosts/#{vhost}/httpdocs/apps/#{application}/current/public /var/www/vhosts/#{vhost}/httpdocs/rails"
  run "ln -s /var/www/vhosts/#{vhost}/httpdocs/apps/#{application}/current/public /var/www/vhosts/#{vhost}/httpdocs/public"

  run "rm -rf #{release_path}/public/system"
  run "ln -s #{shared_path}/system #{release_path}/public/system"
  
  %w(swfs banners).each do |dir|
    run "rm -fr #{release_path}/public/#{dir}"
    run "ln -s #{shared_path}/system/#{dir} #{release_path}/public/#{dir}"
  end
end