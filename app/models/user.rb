# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string           not null
#  password_digest :string      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  
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
    incoming_friendship_links - mutuals
  end

  def outgoing_friend_requests
    outgoing_friendship_links.except do |link|

      # TODO: LMAO try again later
      #
      mutuals = outgoing_friendship_links.except { |friendship| incoming_friendship_links.include?  }
    end
    outgoing_friendship_links.except { |f| }
  end


  def mutuals
    outgoing_friendship_links.each_with_object([]) do |friendship, memo|
      memo << friendship if incoming_friendship_links.include? friendship.mutual
    end
  end

  private

  def outgoing_friendship_links
    Friendship.where(user: self)
  end

  def incoming_friendship_links
    Friendship.where(friend: self)
  end
end
