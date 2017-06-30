require 'sinatra/base'
require 'logger'
require 'fileutils'

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
  Logger.new log_file
end

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, get_public_dir
    set :sessions, Hash.new
    set :root_dir, File.expand_path('../..', __FILE__)
    set :logger, get_logger(root_dir)
    use Rack::CommonLogger, settings.logger
    enable :logging if $app_config.fetch('logging', true)
  end

  def logger
    settings.logger
  end

  def root_dir
    settings.root_dir
  end

  helpers ApplicationHelper

  not_found { 'Page Not Found!!' }

end