# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  display_name    :string
#  unique_name     :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
class User < ApplicationRecord
  has_secure_password
  before_save :set_default_display_name

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :posts, dependent: :nullify

  has_one :profile, dependent: :destroy

  after_create :create_user_profile

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :unique_name, presence: true, uniqueness: { case_sensitive: false }

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def incoming_friend_requests
    incoming_friendship_links.where(mutual: false)
  end

  def outgoing_friend_requests
    outgoing_friendship_links.where(mutual: false)
  end

  def mutual_friendships
    # right now only shows current_user's side
    outgoing_friendship_links.where(mutual: true)
  end

  private

  def create_user_profile
    build_profile.save
  end

  def set_default_display_name
    self.display_name = unique_name if display_name.blank?
  end

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
