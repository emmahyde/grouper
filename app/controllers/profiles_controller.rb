class ProfilesController < ApplicationController
  def show
    @profile = Profile.includes([:user]).find_by(user_id: params[:user_id])
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
    user = current_user
    @profile = Profile.find_by(user_id: user.id)
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
end
