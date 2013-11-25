require 'rvm/capistrano'
require 'bundler/capistrano'

#set :rvm_ruby_string, :local        # use the same ruby as used locally for deployment

#before 'deploy', 'rvm:install_rvm'  # update RVM
#before 'deploy', 'rvm:install_ruby' # install Ruby and create gemset (both if missing)

default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :application, "bone-density-analyzer"
set :repository,  "ssh://git@git.tsaiid.idv.tw/repos/bone-density-analyzer.git"
set :branch, "master"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names

role :web, "192.168.197.233"                          # Your HTTP server, Apache/etc
role :app, "192.168.197.233"                          # This may be the same as your `Web` server
role :db,  "192.168.197.233", :primary => true # This is where Rails migrations will run

set :user, "tsaiid"
set :port, "22"
set :ssh_options, { :forward_agent => true }

set :deploy_to, "/home/tsaiid/rails/bone-density"
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :copy_config_files, :roles => [:app] do
    db_config = "#{shared_path}/database.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end

  task :update_symlink do
    run "ln -s #{shared_path}/public/system #{current_path}/public/system"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :init do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

  desc "reset the database"
  task :reset do
    run "cd #{current_path}; bundle exec rake db:drop db:create db:migrate RAILS_ENV=#{rails_env}"
  end
end

after "deploy", "deploy:migrate"
