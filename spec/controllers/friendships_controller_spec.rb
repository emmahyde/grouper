require 'rails_helper'

describe FriendshipsController, type: :request do
  describe '#create' do
    subject do
      post friendships_url,
        params: {
          from_user_id: user_one.id,
          to_user_id:   user_two.id,
        }
    end

    context 'when both users exist' do
      let(:user_one) { create :user }
      let(:user_two) { create :user }

      it 'returns 201' do
        expect { subject }.to change(Friendship, :count).by 1
        expect(response).to have_http_status :created
        expect(response.body).to include user_one.email
        expect(response.body).to include user_two.email
      end
    end
  end

  describe '#accept' do
    subject do
      post accept_friendships_url,
        params: {
          friendship_id: friendship.id,
        }
    end

    context 'when friendship request exists' do
      let(:user_one)    { create :user }
      let(:user_two)    { create :user }
      let!(:friendship) { create :friendship, user: user_one, friend: user_two }

      it 'returns 201' do
        expect { subject }.to change(Friendship, :count).by 1
        expect(response).to have_http_status :created
        expect(response.body).to include(user_one.email)
        expect(response.body).to include(user_two.email)
      end
    end
  end
end
