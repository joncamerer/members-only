class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      log_in user
      remember_user(user) if params[:session][:remember_me] == "1"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def delete
    log_out
    redirect_to root_url
  end
end
