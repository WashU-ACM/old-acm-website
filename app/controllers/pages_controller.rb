class PagesController < ApplicationController
  # use this controller to add extra pages which don't
  # require data from the database	
  
  before_filter :require_login, only: [:admin, :submissions]
  before_filter :require_admin, only: [:admin, :submissions]
  
  def home
  end

  def invalid_request
  end

  def calendar
  end

  def admin
  end

  def submissions
  	@acm_projects = AcmProject.all
  	@approved = AcmProject.all.where("status = 'approved'")
  	@pending = AcmProject.all.where("status = 'pending'")
  end
  
  def not_found
    render status: 404
  end
end
