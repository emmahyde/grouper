class ProfilesController < ApplicationController
  before_action :find_user
  before_action :find_profile
  before_action :authorize_current_user, only: %i[edit update]

  def show
    @posts = Post.where(user: @user).includes([:user]).page(params[:page]).per(15) if @profile
    respond_to do |format|
      format.html do
        @post = Post.new

        render :show # implicit if removed bc name match, but wanted to be explicit while debugging
      end
      format.turbo_stream
    end
  end

  def friends
    @friendships = @user.mutual_friendships.includes(friend: :profile).page(params[:page]).per(15)
    respond_to do |format|
      format.html do
        render :friends # implicit if removed bc name match, but wanted to be explicit while debugging
      end
      format.turbo_stream
    end
  end

  def edit
    respond_to do |format|
      format.html do
        render :edit
      end
    end
  end

  def update
    respond_to do |format|
      format.html do
        if @profile.update!(profile_params)
          redirect_to profile_path(@user), notice: 'Profile was successfully updated.'
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:picture, :description, user_attributes: %i[id display_name])
  end

  def authorize_current_user
    redirect_to root_url unless current_user == @user
  end

  def find_user
    @user ||=
      if params[:unique_name]
        User.find_by(unique_name: params[:unique_name])
      elsif params[:user_id]
        User.find(params[:user_id])
      end
  end

  def find_profile
    @profile ||= @user.profile
  end
end
