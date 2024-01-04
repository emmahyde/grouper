require 'rails_helper'

describe Friendship do
  describe 'validations' do
    let!(:user) { create :user, :with_friends }

    describe ':user_is_not_friend' do
      it 'disallows duplicate values, as a primary key' do
        expect { user.friends.push(user) }.to raise_error(
          ActiveRecord::RecordInvalid,
          'Validation failed: User is reserved'
        )
      end
    end

    context 'when the user is deleted' do
      it 'cascades deletions for friendships where this is the user' do
        expect { user.destroy }.to change(described_class, :count).by(-2)
      end
    end

    context 'when the friend is deleted' do
      it 'cascades deletions for friendships where this is the friend' do
        expect { user.friends.first.destroy }.to change(described_class, :count).by(-1)
      end
    end
  end
end
