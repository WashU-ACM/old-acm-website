class CreateProjects < ActiveRecord::Migration
	def change
		create_table :projects do |t|
			t.string :name
			t.string :description
			t.integer :state

			# one-to-many association:
			t.integer :owner_id

			t.timestamps
		end
	end
end
