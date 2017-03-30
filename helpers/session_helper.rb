require 'sinatra'

module ApplicationHelper

  def get_session(sid)
    settings.sessions[sid]
  end

  def create_session(sid)
    settings.sessions[sid] = {}
  end
end