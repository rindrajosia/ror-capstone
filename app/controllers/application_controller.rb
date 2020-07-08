class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:auth]
      @current_user = User.find(session[:auth]['id'])
    end
  end
end
