class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.get_new_session_token
    if @user.save
      login_user!
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
