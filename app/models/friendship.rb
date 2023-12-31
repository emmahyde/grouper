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
  self.primary_key = %i[user_id friend_id]

  # TODO: :from_user and :to_user instead of :user / :friend
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, uniqueness: { scope: [:friend_id] }
  validate :user_is_not_friend

  private

  def user_is_not_friend
    errors.add(:friend, "can't be the same as the user") if user == friend
  end
end
