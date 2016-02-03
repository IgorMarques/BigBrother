class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  before_action :set_client

  def logged_in?
    !!session[:token] #double negation to convert to boolean
  end

  def current_user
    @current_user ||=  session[:user]#memoized
  end

  def set_client
    Octokit.auto_paginate = true
    @client = Octokit::Client.new(access_token: session[:token])
  end
end
