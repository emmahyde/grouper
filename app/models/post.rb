class Post < ApplicationRecord
# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
  belongs_to :user, dependent: :destroy
end
