class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    @user = User.new(auth_hash)

    if @user
      session[:user] = @user
    end

    redirect_to root_url
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
