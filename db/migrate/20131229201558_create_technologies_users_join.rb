class CreateTechnologiesUsersJoin < ActiveRecord::Migration
  def change
    create_table :technologies_users_joins, :id => false do |t|
	t.integer :technology_id
	t.integer :user_id
    end
  end
end
