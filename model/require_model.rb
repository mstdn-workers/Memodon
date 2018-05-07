# ActiveRecordと接続する
config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(config['db'][ENV['RACK_ENV']])

# model以下にあるすべてのファイルをrequireする
Dir.glob('./model/*.rb') do |absolute_path|
  model = absolute_path.match(/\.\/model\/(.*\.rb)/)[1]
  next if model == 'require_model.rb'
  require "./model/#{model}"
end
