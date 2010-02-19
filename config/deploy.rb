set :stages, %w(staging production)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

set :application, "wi"
role :app, "67.23.79.33"
role :web, "67.23.79.33"
role :db,  "67.23.79.33", :primary => true

set :use_sudo, false
set :user, 'www-data'

set :repository,  "git@github.com:withit/#{application}.git"
set :deploy_to, "/var/rails/#{application}"

set :scm, :git
set :branch, :rebuild

namespace :deploy do
  desc "Restart the application by touching tmp/restart.txt."
  task :restart, :roles => :app do
    run "touch  #{release_path}/tmp/restart.txt"
  end
end
  
task :after_update_code, :roles => :app do
  %w(swfs banners).each do |dir|
    run "rm -fr #{release_path}/public/#{dir}"
    run "ln -s #{shared_path}/system/#{dir} #{release_path}/public/#{dir}"
  end
end