class CreateProjectsTechnologiesJoin < ActiveRecord::Migration
  def change
    create_table :projects_technologies_joins, :id => false do |t|
	t.integer :poject_id
	t.integer :technology_id
    end
  end
end
