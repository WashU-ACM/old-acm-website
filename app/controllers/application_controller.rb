class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    redirect_to(root_url, notice: t("require_login")) and return if current_user.nil?
  end

  def require_admin
    redirect_to(root_url, notice: t("require_admin")) and return unless current_user.is_admin?
  end

  # Call this from other require methods
  def permission_redirect
    redirect_to(root_url, notice: t("require_permission")) and return
  end
  
  def full_name(id)
    u = User.find(id)
    return u.first_name + " " +  u.last_name
  end
  helper_method :full_name
  
end	
