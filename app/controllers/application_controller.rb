class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private

  def current_user
    begin 
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id]) 
    unless current_user == @user
      redirect_to root_url, :notice => "Access Denied."
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to root_url, :notice => "You need to sign in to access this page!"
    end
  end
  
end
