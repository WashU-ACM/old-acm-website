class PagesController < ApplicationController
  #use this controller to add extra pages which don't
  #require data from the database	
  
  def home
    
  end
  def invalid_request
    
  end
  def calendar
    
  end
  def admin
    if !current_user or current_user.role != "admin"
	redirect_to "/invalid_request"
    end
  end
  def submissions
      if !current_user or current_user.role != "admin"
	  redirect_to "/invalid_request"
      else
	@acm_projects = AcmProject.all
	@approved = AcmProject.all.where("status = 'approved'")
	@pending = AcmProject.all.where("status = 'pending'")
      end
  end
  

  
  def not_found
    render status: 404
  end
end
