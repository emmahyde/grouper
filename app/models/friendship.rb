# == Schema Information
#
# Table name: friendships
#
#  user_id    :bigint           not null, primary key
#  friend_id  :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null

# NOTE: the PK of `friendships` is a composite of [user_id, friend_id].
#       the inverse of:  Friendship<id: [1, 2], user_id: 1, friend_id: 2>
#       is:              Friendship<id: [2, 1], user_id: 2, friend_id: 1>
class Friendship < ApplicationRecord
  self.primary_key = %i[user_id friend_id]

  # TODO: :from_user and :to_user instead of :user / :friend
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, uniqueness: { scope: [:friend_id] }
  validates :user_id, exclusion: { in: ->(friendship) { [friendship.friend_id] } }

  # returns nil if the Friendship has not been accepted
  # otherwise returns the Friendship
  # calling this will continue to query until one is found
  # and then will only query if it has not been instantiated in memory
  # this is "lazy" right now
  def inverse
    @inverse ||= Friendship.find(inverse_pk)
  end

  private

  def inverse_pk
    [friend.id, user.id]
  end
end
