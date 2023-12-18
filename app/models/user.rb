# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_one :profile, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :email, uniqueness: true
end
