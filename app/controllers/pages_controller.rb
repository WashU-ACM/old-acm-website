class PagesController < ApplicationController
  # use this controller to add extra pages which don't
  # require data from the database	
  
  before_filter :require_login, only: [:admin]
  before_filter :require_admin, only: [:admin]
  
  def home
  end

  def invalid_request
  end

  def calendar
  end

  def admin
  end
  
  def not_found
    render status: 404
  end
end
