
set :application, 'mydomain_net'
set :repo_url, 'git@github.com:inforserver2/mydomainsite.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/var/web/production.gamblerserver.com'
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :linked_files, %w{config/database.yml config/astrails.rb}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

namespace :custom do

  desc 'Run commands'
  task :console do
    on roles(:web) do
       within release_path do
         execute :rake, 'tmp:clear'
       end
    end
  end

end

