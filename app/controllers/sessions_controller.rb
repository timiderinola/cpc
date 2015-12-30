class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to root_path,
          notice: 'You are now logged in!'
    else
      flash.now.alert = 'Invalid login credentials. Contact Site Admin if you forgot your credentials.'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path,
        notice: 'You have been logged out successfully!'
  end
end