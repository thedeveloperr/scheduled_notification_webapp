# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require_relative 'config/application'
Rails.application.load_tasks
require 'resque/tasks'
require 'resque/scheduler/tasks'
task 'resque:preload' => :environment
namespace :resque do
  task :setup do
    require 'resque'
  end
  task :setup_schedule => :setup do
    require 'resque-scheduler'
  end
  task :scheduler => :setup_schedule
end
