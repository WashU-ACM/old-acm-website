class AddMoreShibbolethFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shib_eppn, :string
    add_column :users, :shib_samaccountname, :string
    add_column :users, :shib_credid, :string
    remove_column :users, :shib_principal, :string
  end
end
