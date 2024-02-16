class ProfilesController < ApplicationController
  before_action :authorize_user, only: %i[edit update]

  def show
    @profile = Profile.includes([:user]).find_by(user_id: params[:user_id])
    @user = @profile.user
    @posts = Post.where(user_id: @profile.user_id).includes([:user]).page(params[:page]).per(15) if @profile
    respond_to do |format|
      format.html do
        @post = Post.new

        render :show # implicit if removed bc name match, but wanted to be explicit while debugging
      end
      format.turbo_stream
    end
  end

  def friends
    @user_id = params[:user_id]
    @friendships = User.find(@user_id).mutual_friendships.includes(friend: :profile).page(params[:page]).per(15)
    respond_to do |format|
      format.html do
        render :friends # implicit if removed bc name match, but wanted to be explicit while debugging
      end
      format.turbo_stream
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
    # @user = User.find(params[:id])
    # @profile = @user.profile
    respond_to do |format|
      format.html do
        render :edit
      end
    end
  end

  def update
    user = current_user
    @profile = Profile.find_by(user_id: user.id)
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :slug, :picture, :description)
  end

  def authorize_user
    user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user == user
  end
end
