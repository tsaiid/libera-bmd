require 'rvm/capistrano'
require 'bundler/capistrano'

#set :rvm_ruby_string, :local        # use the same ruby as used locally for deployment

#before 'deploy', 'rvm:install_rvm'  # update RVM
#before 'deploy', 'rvm:install_ruby' # install Ruby and create gemset (both if missing)

default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :application, "bone-density-analyzer"
set :repository,  "git@github.com:tsaiid/libera-bmd.git"
set :scm, "git"
set :branch, "master"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names

role :web, "vghks.tsai.it"
role :app, "vghks.tsai.it"
role :db,  "vghks.tsai.it", :primary => true # This is where Rails migrations will run

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
  task :symlink_db, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" # This file is not included repository, so we will create a symlink 
  end
  task :symlink_secret_token, :roles => :app do
    run "ln -nfs #{shared_path}/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb" # This file is not included repository, so we will create a symlink 
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

before 'deploy:assets:precompile', 'deploy:symlink_db' # callback: run this task before deploy:assets:precompile
before 'deploy:assets:precompile', 'deploy:symlink_secret_token' # # callback: run this task before deploy:assets:precompile
after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup" # delete old releases
