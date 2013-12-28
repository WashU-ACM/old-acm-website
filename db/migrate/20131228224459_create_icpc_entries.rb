class CreateIcpcEntries < ActiveRecord::Migration
  def change
    create_table :icpc_entries do |t|
      t.integer :UVaID
      t.string :Name
      t.text :Description
      t.text :Code
      t.integer :UserId

      t.timestamps
    end
  end
end
