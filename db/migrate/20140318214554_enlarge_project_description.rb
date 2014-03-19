class EnlargeProjectDescription < ActiveRecord::Migration
  def up
    change_column :projects, :description, :text
  end
end
