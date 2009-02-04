set :stages, %w(staging prodution)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

set :application, "wi"
set :user, 'withit'
set :svn_path, 'wi'
set :use_sudo, false
set :vhost,  "staging.wi.com.au"
role :app, "203.145.48.37"
role :web, "203.145.48.37"
role :db,  "203.145.48.37", :primary => true

set :deploy_to, "/var/www/vhosts/#{vhost}/httpdocs/apps/#{application}"
set :svn_user, ENV['svn_user'] || Proc.new { Capistrano::CLI.password_prompt('SVN User: ') }
set :svn_password, ENV['svn_password'] || Proc.new { Capistrano::CLI.password_prompt('SVN Password: ') }
set :repository,
Proc.new { "--username #{svn_user} " +
             "--password #{svn_password} " +
             "--no-auth-cache " +
             "http://trac.wi.com.au/svn/repo1/#{svn_path}/trunk/"}

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

  %w(logos pictures slides).each do |dir|
    run "rm -f #{release_path}/#{dir}"
    run "ln -s #{release_path}/#{dir} #{shared_path}/system/#{dir}"
  end
end