class RenameCategoriesProjectsToCategorizations < ActiveRecord::Migration
  def change
	rename_table :categories_projects, :categorizations
  end
end
