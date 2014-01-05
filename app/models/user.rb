class User < ActiveRecord::Base

  
	#relationships
	has_many :icpc_entries
	has_many :projects, foreign_key: "owner_id"
	has_and_belongs_to_many :interested_projects, class_name: "Project"
	has_and_belongs_to_many :technologies

	def self.from_omniauth(auth)
		where(auth.slice("provider","open_id")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.open_id = auth["uid"]
			user.first_name = auth["info"]["first_name"]
			user.last_name = auth["info"]["last_name"]
			user.email = auth["info"]["email"]
		end
			
				
	end
end
