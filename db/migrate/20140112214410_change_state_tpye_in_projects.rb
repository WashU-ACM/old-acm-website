class ChangeStateTpyeInProjects < ActiveRecord::Migration
  def change
      change_column :projects, :state, :string
  end
end
