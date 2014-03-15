class RemoveBootsy < ActiveRecord::Migration
  def up
    drop_table :bootsy_image_galleries
    drop_table :bootsy_images
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
