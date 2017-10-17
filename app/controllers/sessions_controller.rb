class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:email])
      log_in user
      remember_user(user) if params[:session][:remember_me] == "1"
    else
      render 'new'
    end
  end

end
