require 'sinatra/base'
require 'logger'
require 'fileutils'
require 'awesome_print'

def get_public_dir
  if $app_config['public_directory']
    $app_config['public_directory']
  else
    File.join(root_dir,'public')
  end
end

def get_logger(root_dir)
  log_dir = "#{root_dir}/log/"
  FileUtils.mkdir log_dir unless Dir.exist? log_dir
  log_file = File.new "#{log_dir}/#{settings.environment}.log", 'a+'
  log_file.sync = true
  logger = Logger.new log_file
  configure do
    enable :logging if $app_config.fetch('logging', true)
    use Rack::CommonLogger, logger
  end
  logger
end

class ApplicationController < Sinatra::Base

  root_dir = File.expand_path '../..', __FILE__

  configure do
    set :public_folder, get_public_dir
    set :sessions, Hash.new
  end

  helpers ApplicationHelper

  before do
    @response_body = { status: 'OK', status_message: 'Success' }
  end

  class << self
    attr_accessor :logger
  end

  @logger = get_logger root_dir

  not_found do
    'Page Not Found!!'
  end

end





