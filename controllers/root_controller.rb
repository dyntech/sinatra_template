class RootController < ApplicationController

  get '/' do
    logger.info 'Hello RootController'
    send_file File.join settings.public_folder, 'index.html'
  end

end