# == Schema Information
#
# Table name: profiles
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  description :string
#  picture     :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :banner, service: :s3_banners
  has_one_attached :picture, service: :s3_profiles do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100], preprocessed: true
  end
end
