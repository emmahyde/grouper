class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id]).joins(:profile)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :display_name, :unique_name, :password, :password_confirmation)
  end
end
