class AddFriendshipsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :friendships, id: false do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :friend, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.primary_key %i[user_id friend_id]

      t.timestamps
    end
  end
end
