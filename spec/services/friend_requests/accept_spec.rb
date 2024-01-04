# frozen_string_literal: true

require 'rails_helper'

describe FriendRequests::Accept do
  subject { described_class.call(friendship_id: friendship.id) }

  let(:user)               { create :user, :with_friends }
  let(:friendship)         { user.friendships.first }
  let(:inverse_friendship) { friendship.inverse }

  describe '#call' do
    it 'creates an inverse friendship' do
      expect(friendship.mutual).to eq false
      expect(friendship.inverse).to be_nil

      expect { subject }.to change(Friendship, :count).by 1
      friendship.reload

      expect(friendship.mutual).to eq true
      expect(inverse_friendship).to be_a Friendship
      expect(inverse_friendship.mutual).to eq true
    end
  end
end
