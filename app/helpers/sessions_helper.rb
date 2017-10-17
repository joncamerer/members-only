module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def remember_user(user)
    user.create_remember_token
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif cookies[:remember_token]
      @current_user ||= User.find_by(remember_token: cookies[:remember_token])
    end

  end

  def current_user=(user)
    @current_user = user
  end
end
