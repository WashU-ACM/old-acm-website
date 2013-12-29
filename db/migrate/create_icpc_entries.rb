class CreateIcpcEntries < ActiveRecord::Migration
  def change
    create_table :icpc_entries do |t|
      t.integer :uva_id
      t.string :name
      t.text :description
      t.text :code
      t.integer :user_id

      t.timestamps
    end
  end
end
