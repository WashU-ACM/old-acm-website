class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	private
		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
	helper_method :current_user
	
	def create_competency(technology)
	 if (Competency.where(:user_id => current_user.id, :technology_id => technology.id)).blank?
	    Competency.create(:user_id => current_user.id, :technology_id => technology.id)
	 else
	   flash[:notice] = "You've already added this technology!"
	 end
	end
	helper_method :create_competency
end	
