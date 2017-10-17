module SessionsHelper

  def log_in(user)
    session[:id] = user.id
  end

  def remember_user(user)
    user.create_remember_token
    cookies.permanent[:remember_token] = user.remember_token
  end
end
