class User < ActiveRecord::Base
	has_many :icpc_entries
	has_many :projects, foreign_key: "owner_id"
	has_and_belongs_to_many :interested_projects, class_name: "Project"
	has_and_belongs_to_many :technologies
end
