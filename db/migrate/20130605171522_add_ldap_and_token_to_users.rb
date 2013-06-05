class AddLdapAndTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guts_token, :string
    add_column :users, :ldap, :string
  end
end
