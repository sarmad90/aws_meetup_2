# config valid only for current version of Capistrano
lock '3.11.0'

# Change the application name with your application name
set :application, 'aws_meetup_2'

# Change the repository URL with your repository URL
set :repo_url, 'git@github.com:sarmad90/aws_meetup_2.git'

# Default branch is :master if you need to use some other branch then uncomment the line below
# And change the branch name with the name of the branch you want to use
# set :branch, :some_other_branch_you_may_want_to_use

# Don't forget to change the username (i.e sarmad in this case) with your username
# And the project directory with the name of your project directory
set :deploy_to, '/home/ubuntu/aws_meetup_2'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

set :rvm_type, :user

# Edit this if you are using a different Ruby version
set :rvm_ruby_version, 'ruby-2.5.3'

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# Pume config
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 4]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# Shoryuken config
set :shoryuken_default_hooks,  true

set :shoryuken_pid,            -> { File.join(shared_path, 'tmp', 'pids', 'shoryuken.pid') }
set :shoryuken_env,            -> { fetch(:rack_env, fetch(:rails_env, fetch(:stage))) }
set :shoryuken_log,            -> { File.join(shared_path, 'log', 'shoryuken.log') }
set :shoryuken_config,         -> { File.join(release_path, 'config', 'shoryuken.yml') }
set :shoryuken_requires,       -> { [] }
set :shoryuken_options,        -> { ['--rails'] }
set :shoryuken_queues,         -> { ['default'] }
set :shoryuken_role,           :app

set :assets_roles, [:web, :app]
set :migration_role, :app
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :rails_assets_groups, :assets
set :keep_assets, 2