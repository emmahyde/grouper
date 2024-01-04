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
require 'rails_helper'

describe Profile do
  context 'when condition' do
    it 'succeeds' do
      pending 'Not implemented'
    end
  end
end
