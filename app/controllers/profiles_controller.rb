class ProfilesController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        @profile = Profile.includes(user: :posts).find_by(user_id: params[:user_id])
        @post = Post.new

        render :show # implicit if removed bc name match, but wanted to be explicit while debugging
      end

      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'next_page',
          partial: 'posts/next_page',
          locals: { posts: @posts }
        )
      end
    end
  end

  def friends
    respond_to do |format|
      format.html do
        @user_id = params[:user_id]
        @friendships = User.find(@user_id).mutual_friendships.page(params[:page]).per(15)

        render :friends # implicit if removed bc name match, but wanted to be explicit while debugging
      end
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
