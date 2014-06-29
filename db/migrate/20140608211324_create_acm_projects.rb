class CreateAcmProjects < ActiveRecord::Migration
  def change
    create_table :acm_projects do |t|
      t.string :name
      t.text :description
      t.integer :owner_id
      t.string :status

      t.timestamps
    end
  end
end
