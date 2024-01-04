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
require 'rails_helper'

describe User do
  context 'when condition' do
    it 'succeeds' do
      pending 'Not implemented'
    end
  end
end
