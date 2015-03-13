class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def login_user!
    session[:token] = @user.get_new_session_token
    @user.save
    redirect_to bands_url    
  end

  def current_user
    User.find_by_session_token(session[:token])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def require_login
    unless current_user
      redirect_to new_session_url
    end
  end
end
