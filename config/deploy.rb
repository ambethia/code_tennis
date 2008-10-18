default_run_options[:pty] = true
set :application, "code_tennis"
set :repository,  "git@github.com:railsrumble/tampa-rb.git"
set :scm, "git"
#set :scm_passphrase
set :user, "deploy"
ssh_options[:forward_agent] = true
set :branch, "master"

set :deploy_to, "/var/www/vhosts/#{application}"


role :app, "66.246.75.37"
role :web, "66.246.75.37"
role :db,  "66.246.75.37", :primary => true