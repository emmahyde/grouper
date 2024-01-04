require 'rails_helper'

describe 'Sessions' do
  describe 'POST /login' do
    let!(:user) { User.create(email: 'user@example.com', password: 'password') }

    context 'with valid credentials' do
      it 'logs the user in and redirects to the root page' do
        post login_path, params: { password: 'password', email: user.email }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      before do
        post login_path, params: { password: 'wrong password', email: user.email }
      end

      it 'does not log the user in' do
        expect(session[:user_id]).to be_nil
      end

      it 'sets a flash.now message' do
        expect(flash.now[:alert]).to include('Invalid email or password')
      end

      it 're-renders the login template' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE /destroy' do
    before do
      delete logout_path
    end

    it 'removes the user id from the session' do
      expect(session[:user_id]).to be_nil
    end

    it 'returns a success status' do
      expect(response).to have_http_status(:found)
    end

    it 'redirects to the login page' do
      expect(response).to redirect_to(login_path)
    end
  end
end
