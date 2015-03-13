class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login_user!
    else
      flash.now[:errors] = "Invalid username and/or password!!"
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    user = current_user
    user.get_new_session_token
    user.save
    session[:token] = nil
  end

  private

end
