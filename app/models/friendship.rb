# == Schema Information
#
# Table name: friendships
#
#  user_id    :bigint           not null, primary key
#  friend_id  :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Friendship < ApplicationRecord
  self.primary_key = [:user_id, :friend_id]

  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
