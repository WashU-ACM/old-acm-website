class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :Name
      t.integer :ProjectID
      t.integer :UserId

      t.timestamps
    end
  end
end
