class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user #double negation to convert to boolean
  end

  def current_user
    @current_user ||=  session[:user] #memoized
  end
end
