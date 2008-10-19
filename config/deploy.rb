set :application, "code_tennis"

set :deploy_to, "/var/apps/#{application}"

set :scm, :git
set :repository,  "git@github.com:railsrumble/tampa-rb.git"
set :git_enable_submodules, true
set :branch, "railsrumble"
set :deploy_via, :remote_cache

role :app, "66.246.75.37"
role :web, "66.246.75.37"
role :db,  "66.246.75.37", :primary => true

ssh_options[:username] = "deploy"
set :run_method, :run

namespace :deploy do
  task :custom_symlinks do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/twitter.yml #{release_path}/config/twitter.yml"
  end
  
  desc "Restart Passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with Passenger"
    task t, :roles => :app do ; end
  end
end

after "deploy:symlink", "deploy:custom_symlinks"
after "deploy", "deploy:cleanup"
before "deploy:migrate", "deploy:custom_symlinks"