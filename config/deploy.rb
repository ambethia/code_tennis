set :application, "code_tennis"

set :deploy_to, "/home/ambethia/www/codetennis.com"

set :scm, :git
set :repository,  "github.code_tennis:ambethia/code_tennis.git"
set :git_enable_submodules, true
set :branch, "release"
set :deploy_via, :remote_cache

role :app, "codetennis.com"
role :web, "codetennis.com"
role :db,  "codetennis.com", :primary => true

ssh_options[:username] = "ambethia"
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

before "deploy:migrate", "deploy:custom_symlinks"
after  "deploy:symlink", "deploy:custom_symlinks"
after  "deploy",         "deploy:cleanup"
