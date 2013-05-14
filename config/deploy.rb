set :application, "humhum.com"
set :repository,  "git://github.com/javajigi/humhum.git"

set :scm, :git

set :user, "javajigi"
set :user_sudo, false
set :deploy_to, "/Users/javajigi/sweng-workspace/workspace/#{application}"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "localhost", :web, :app, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

namespace :deploy do
  task :debug_env do
  	run "env"
  end
  task :bundle_gems do
  	run "cd #{deploy_to}/current && bundle install vendor/gems"
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{deploy_to}/current && rails server"
  end
end