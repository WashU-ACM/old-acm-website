class User < ActiveRecord::Base
	has_many :icpc_entries
	has_many :projects
	has_and_belongs_to_many :projects
	has_and_belongs_to_many :technologies
end
