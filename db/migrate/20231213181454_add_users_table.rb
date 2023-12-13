class AddUsersTable < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
