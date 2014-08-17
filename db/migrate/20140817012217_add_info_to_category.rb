class AddInfoToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :class_name, :string
  end
end
