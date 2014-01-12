class Technology < ActiveRecord::Base
  
	
	#has_and_belongs_to_many :technologies
	has_many :competencies
	has_many :users, through: :competencies
	
end	
