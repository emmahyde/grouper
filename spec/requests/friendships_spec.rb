require 'rails_helper'

describe 'Friendships' do
  let(:user_one) { create :user, password: 'password' }
  let(:user_two) { create :user }

  before do
    sign_in_as(user_one)
  end

  describe '#index: GET /' do
    subject do
      get friendships_url
    end

    let!(:friendship) { create :friendship, user: user_one, friend: user_two }

    it 'returns 200' do
      subject
      expect(response).to have_http_status :ok
      expect(response.body).to include user_one.email
      expect(response.body).to include user_two.email
    end
  end

  describe '#create: POST /' do
    subject do
      post friendships_url,
        params: {
          to_user_id: user_two.id,
        }
    end

    context 'when both users exist' do
      it 'returns 201' do
        expect { subject }.to change(Friendship, :count).by 1
        expect(response).to have_http_status :created
        expect(response.body).to include user_one.email
        expect(response.body).to include user_two.email
      end
    end
  end

  describe '#accept: POST /accept' do
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
