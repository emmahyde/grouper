require 'rails_helper'

RSpec.describe Post do
  describe 'validations' do
    it 'is not valid without content' do
      post = described_class.new(text: nil)
      expect(post).not_to be_valid
    end

    it 'is not valid without a user' do
      post = described_class.new(user_id: nil)
      expect(post).not_to be_valid
    end
  end
end
