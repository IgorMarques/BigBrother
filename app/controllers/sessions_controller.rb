class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    session[:token] = auth_hash["credentials"]["token"]
    redirect_to organizations_path
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
