class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :shib_uid
			t.string :shib_affiliation
			t.string :shib_principal
			t.string :first_name
			t.string :last_name
			t.string :email
			t.string :open_id
			t.text :personal_bio

			t.timestamps
		end
	end
end
