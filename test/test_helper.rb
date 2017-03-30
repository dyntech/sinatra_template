ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'sinatra'
require 'sinatra/base'
require 'sequel'
require 'yaml'
require 'awesome_print'

$app_config = YAML.load_file('config/app.yml')["#{ENV.fetch('RACK_ENV', 'development')}"]
$db = Sequel.connect $app_config['database']

%w( ./lib/*.rb ./helpers/*.rb ./models/*.rb ./controllers/*.rb).each do |dir|
  Dir.glob(File.expand_path(dir)).each do |file|
    require file
  end
end

