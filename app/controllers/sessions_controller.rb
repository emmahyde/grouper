class SessionsController < ApplicationController
  def new
    return unless current_user

    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, status: :see_other, notice: 'User was successfully logged in'

    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
