class AddSlugs < ActiveRecord::Migration
	def change
		add_column :acm_projects, :slug, :string
		add_column :projects, :slug, :string
		add_column :users, :slug, :string

		add_index :acm_projects, :slug, unique: true
		add_index :projects, :slug, unique: true
		add_index :users, :slug, unique: true

		say "Make sure to update the models to generate the slugs."
		say "e.g., Project.all.each{ |v| v.save! }"
	end
end
