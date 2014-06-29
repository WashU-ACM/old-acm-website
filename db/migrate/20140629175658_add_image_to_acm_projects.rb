class AddImageToAcmProjects < ActiveRecord::Migration
  def change
    add_column :acm_projects, :image, :string
  end
end
