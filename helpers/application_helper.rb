require 'sinatra'

module ApplicationHelper


  def exception_500(e)
    exception_message 500, { error: true, message: e.message, stack: e.backtrace.join("\n\t") }.to_json
  end

  def error_500(message)
    error_message 500, { error: true, message: message }.to_json
  end

  def exception_message(code, e)
    halt code, { error: true, message: e.message, stack: e.backtrace.join("\n\t") }.to_json
  end

  def error_message(code, message)
    halt code, message
  end

  def set_error(response, message)
    response[:status] = 'ERROR'
    response[:status_message] = message
  end

end