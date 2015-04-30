# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'configunix-frontend'
set :repo_url, 'https://github.com/suitepad-gmbh/configunix-frontend.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_via, :copy
set :deploy_to, '/var/www/configunix-frontend'

################################################################################
# Overwrite original Capistrano tasks
#
# See https://github.com/capistrano/capistrano/issues/722 for details
################################################################################

Rake::Task["deploy:check"].clear
Rake::Task["deploy:updating"].clear

namespace :deploy do

  # Omit SCM calls
  task :check do
    invoke 'deploy:check:directories'
    invoke 'deploy:check:linked_dirs'
    invoke 'deploy:check:make_linked_dirs'
    invoke 'deploy:check:linked_files'
  end

  # Build application in current environment and zip the contents of the dist
  # folder.
  task :build_release => :new_release_path do
    build_name = fetch :application
    zip_file   = "#{build_name}-#{release_timestamp}.zip"
    tmp_path   = fetch :tmp_path, '/tmp/capistrano'

    run_locally do
      execute :git, 'submodule', 'init'
      execute :git, 'submodule', 'update'
      execute :npm, 'install', '-g', 'ember-cli'
      execute :npm, 'install', '-g', 'bower'
      execute :npm, 'install'
      execute :bower, 'install'
      execute :ember, 'build', "--environment=#{fetch :stage}"
      execute :mkdir, tmp_path unless Dir.exists?(tmp_path)
      execute :zip, '-r', "#{tmp_path}/#{zip_file}", './dist'
    end
  end

  task :updating => :new_release_path do
    build_name = fetch :application
    tmp_path   = fetch :tmp_path, '/tmp/capistrano'
    zip_file   = "#{build_name}-#{release_timestamp}.zip"
    zip_path   = "#{tmp_path}/#{zip_file}"

    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', release_path
      upload! zip_path, release_path, recursive: true

      within release_path do
        execute :unzip, zip_file
        execute :rm, zip_file
        execute :mv, 'dist/*', '.'
        execute :rm, '-rf', 'dist'
      end
    end

    invoke 'deploy:symlink:shared'
  end

  before :updating, :build_release
end
