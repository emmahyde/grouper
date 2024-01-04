# == Schema Information
#
# Table name: friendships
#
#  user_id    :bigint           not null, primary key
#  friend_id  :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mutual     :boolean          default(FALSE), not null
#
require 'rails_helper'

describe Friendship do
  describe 'validations' do
    let!(:user) { create :user, :with_friends }

    describe ':user_id' do
      # describe 'uniqueness' do
      # end

      describe 'exclusion' do
        it 'disallows duplicate values, as a primary key' do
          expect { user.friends.push(user) }.to raise_error(
            ActiveRecord::RecordInvalid,
            "Validation failed: User can't be the same as the friend",
          )
        end
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

  # describe '#inverse' do
    # it 'queries for the inverse composite primary key record' do
    #
    # end
  # end
end
