class ProfilesController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        @profile = Profile.includes(user: :posts).find_by(user_id: params[:user_id])
        @post = Post.new
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
    @user_id = params[:user_id]
    @friendships = User.find(@user_id).mutual_friendships.page(params[:page]).per(15)
    respond_to do |format|
      # TODO: next_page needs to be abstracted into a shared file if possible.
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'content',
          partial: 'friendships/next_page',
          locals: { friendships: @friendships }
        )
      end
      # This shouldnt be necessary, we're using a turbo frame
      # format.html { redirect_to user_profile_path(params[:user_id]) }
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
