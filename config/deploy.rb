set :application, "assassin"
set :repository,  "git@github.com:LogicWolfe/rubber-chicken-assassin.git"

set :deploy_to, '/webapps/assassin.logicaldecay.com'
set :deploy_via, :remote_cache
set :user, 'ubuntu'

ssh_options[:forward_agent] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "assassin.logicaldecay.com"                          # Your HTTP server, Apache/etc
role :app, "assassin.logicaldecay.com"                          # This may be the same as your `Web` server
role :db,  "assassin.logicaldecay.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy:update_code", "deploy:install_gems"
after "deploy:update_code", "deploy:symlink_configs"

namespace :deploy do
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :install_gems do
    run <<-CMD
      cd #{release_path} &&
      #{try_sudo} nice -n 19 ionice -c 3 bundle install --without development
    CMD
  end

  task :symlink_configs do
    run <<-CMD
      ln -nsf #{shared_path}/config/database.yml #{release_path}/config/database.yml
    CMD
  end
end

namespace :dragonfly do
  desc "Symlink the Rack::Cache files"
  task :symlink, :roles => [:app] do
    run "mkdir -p #{shared_path}/tmp/dragonfly && ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"
  end
end

after 'deploy:update_code', 'dragonfly:symlink'