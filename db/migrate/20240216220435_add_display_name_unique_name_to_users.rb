class AddDisplayNameUniqueNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :display_name, :string, null: false
    add_column :users, :unique_name, :string, null: false
  end
end
