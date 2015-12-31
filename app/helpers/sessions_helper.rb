module SessionsHelper

  def login(user)
    cookies[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def logged_in?
    !self.current_user.nil?
  end

  def logged_in_user
    if !logged_in?
      redirect_to login_path,
                  alert: 'Sorry, you need to be logged in to access that page.'
    end
  end

  def logout
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
