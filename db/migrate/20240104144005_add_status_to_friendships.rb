class AddStatusToFriendships < ActiveRecord::Migration[7.1]
  def change
    add_column :friendships, :mutual, :boolean, default: false, null: false
  end
end
