require 'sinatra/base'
require 'sequel'
require 'yaml'

$app_config = YAML.load_file('config/app.yml')["#{ENV.fetch('RACK_ENV', 'development')}"]
$db = Sequel.connect $app_config['database']

%w( ./lib/*.rb ./helpers/*.rb ./models/*.rb ./controllers/*.rb).each do |dir|
  Dir.glob(File.expand_path(dir)).sort.each do |file|
    require file
  end
end

map '/' do
  run RootController
end

