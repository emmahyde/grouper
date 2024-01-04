require 'rails_helper'

describe 'Users' do
  describe 'GET /new' do
    it 'returns http success' do
      get registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    before do
      post registration_path, params: { user: { password: 'password', email: 'user@example.com' } }
    end

    it 'redirects to home page' do
      expect(response).to redirect_to(root_path)
    end
  end
end
