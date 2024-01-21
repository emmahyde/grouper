class ProfilesController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        @profile = Profile.includes(user: :posts).find_by(user_id: params[:user_id])
        @posts = Post.where(user_id: @profile.user_id).page(params[:page]).per(15) if @profile

        @post = Post.new

        render :show # implicit if removed bc name match, but wanted to be explicit while debugging
      end
      format.turbo_stream
    end

    User.joins(friendships: [friend: :profile]).first
  end

  def friends
    respond_to do |format|
      format.html do
        @user_id = params[:user_id]
        @friendships = User.find(@user_id).mutual_friendships.includes(friend: :profile)

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
