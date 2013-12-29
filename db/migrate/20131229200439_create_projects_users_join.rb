class CreateProjectsUsersJoin < ActiveRecord::Migration
  def change
    create_table :projects_users_joins, :id => false do |t|
	t.integer :category_id
	t.integer :interested_user_id
    end
  end
end
