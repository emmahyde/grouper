module RequestHelper
  def sign_in_as(user)
    post login_url, params: { password: 'password', email: user.email }
  end
end
