# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
class User < ApplicationRecord
  has_secure_password

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :posts

  # TODO: when adding the below association, we may need to rework the others
  #       so that they make a basic amount of sense - `friends` are really just
  #       users that have a mutual friend request
  # has_many :incoming_friend_requests, through: :friendships, foreign_key: :friend_id

  validates :email, uniqueness: true

  def incoming_friend_requests
    incoming_friendship_links.where(mutual: false)
  end

  def outgoing_friend_requests
    outgoing_friendship_links.where(mutual: false)
  end

  def mutual_friendships
    incoming_friendship_links.where(mutual: true)
  end

  private

  def outgoing_friendship_links
    Friendship.where(user: self)
  end

  def incoming_friendship_links
    Friendship.where(friend: self)
  end

  def all_friendship_links
    outgoing_friendship_links + incoming_friendship_links
  end

end
