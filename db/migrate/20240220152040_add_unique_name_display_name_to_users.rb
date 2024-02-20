class AddUniqueNameDisplayNameToUsers < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_column :users, :unique_name, :string, null: false
    add_index :users, :unique_name, unique: true, algorithm: :concurrently
    add_column :users, :display_name, :string
  end
end
