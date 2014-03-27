class PagesController < ApplicationController
  #use this controller to add extra pages which don't
  #require data from the database	
  
  def home
    
  end
  def invalid_request
    
  end
  def calendar
    
  end
  
  def not_found
    render status: 404
  end
end
