class RemoveInterests < ActiveRecord::Migration
  def change
  	drop_table :interests
  	drop_table :projects_users
  end
end
