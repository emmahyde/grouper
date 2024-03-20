require 'rails_helper'

describe 'Profiles' do
  let!(:user_one) { create(:user, :with_posts, :with_mutual_friends) }
  let!(:user_two) { create(:user, :with_posts, :with_mutual_friends) }

  before do
    post login_url, params: { password: user_one.password, email: user_one.email }
  end

  describe 'GET /profile' do
    context "when viewing the current_user's profile" do
      before do
        get profile_path user_one
      end

      it 'returns an :ok status code' do
        expect(response).to have_http_status :ok
      end

      it "shows the list of the current_user's posts" do
        expect(response.body).to include user_one.posts.first.text
      end
    end

    context "when viewing another user's profile" do
      before do
        get profile_path user_two
      end

      it 'returns an :ok status code' do
        expect(response).to have_http_status :ok
      end

      it "shows the list of the selected user's posts" do
        expect(response.body).to include(user_two.posts.first.text)
      end
    end
  end

  describe 'GET /friends' do
    context "when on the current_user's profile" do
      before do
        get profile_path user_one
        get friends_profile_path user_one
      end

      it 'returns an :ok status code' do
        expect(response).to have_http_status :ok
      end

      # it 'returns a turbo_stream response' do
      #   expect(response.media_type).to eq Mime[:turbo_stream]
      # end

      it 'shows the mutual friendships of the current_user' do
        expect(response.body).to include user_one.friends.first.display_name
      end
    end

    context "when on another user's profile" do
      before do
        get profile_path user_two
        get friends_profile_path user_two
      end

      it 'returns an :ok status code' do
        expect(response).to have_http_status :ok
      end

      it 'shows the mutual friendships of the selected user' do
        expect(response.body).to include user_two.friends.first.display_name
      end
    end
  end

  describe '#edit: GET /edit' do
    context "when on the current_user's profile" do
      it 'renders the edit form for the profile page' do
        skip('view has yet to be created')
      end
    end

    context "when on another user's profile" do
      it 'returns an :unauthorized as it should not be possible' do
        skip('view has yet to be created')
      end
    end
  end

  describe ':update: PUT /edit' do
    context "when on the current_user's profile" do
      it "renders the view for the current user's profile" do
        skip('view has yet to be created')
      end
    end

    context "when on another user's profile" do
      it 'returns an :unauthorized as it should not be possible' do
        skip('view has yet to be created')
      end
    end
  end
end
