class RemoveTechnologies < ActiveRecord::Migration
	def change
		drop_table :technologies
		drop_table :projects_technologies
		drop_table :technologies_users
		drop_table :competencies
	end
end
