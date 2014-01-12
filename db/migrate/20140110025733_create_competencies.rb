class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.integer :user_id
      t.integer :technology_id

      t.timestamps
    end
  end
end
