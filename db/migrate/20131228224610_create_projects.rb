class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :Name
      t.string :Description
      t.integer :State
      t.integer :UserId
      t.integer :TechnologyId

      t.timestamps
    end
  end
end
