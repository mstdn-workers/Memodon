require 'active_record'
require 'yaml'
require 'erb'

config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(config['db'][ENV['RACK_ENV']])

namespace :db do
  task :migrate do
    ActiveRecord::Tasks::DatabaseTasks.migrate
  end

  task :rollback do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Base.connection.migration_context.rollback(step)
  end
end
