class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ShibUID
      t.string :ShibAffiliation
      t.string :ShibPrincipal
      t.string :FirstName
      t.string :LastName
      t.string :EMail
      t.string :OpenID
      t.string :PersonalBio
      t.integer :ProjectID
      t.integer :ICPCEntryId
      t.integer :TechnologyId

      t.timestamps
    end
  end
end
