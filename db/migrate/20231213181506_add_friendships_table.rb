class AddFriendshipsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :friendships, primary_key: [:user_id, :friend_id] do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      # unable to infer to_table name
      t.references :friend, null: false, foreign_key: { to_table: :users, on_delete: :cascade }

      t.timestamps
    end
  end
end
