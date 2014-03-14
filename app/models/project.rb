class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_and_belongs_to_many :enthusiasts, class_name: "User"
	has_and_belongs_to_many :technologies
	
	mount_uploader :image, ImageUploader
	
	#simulated ENUM field in Projects table
	validates_inclusion_of :state, :in => ["active", "inactive"]
	def state
	  read_attribute(:state)
	end
	def state= (value)
	  write_attribute(:state, value)
	end
	
	
end
