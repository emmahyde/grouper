class FeedsController < ApplicationController
  before_action :require_login
  def main_feed
    # This is so we have the users' name with the post instead of just their id's.
    @posts = Post.joins(:user)
                 .select('posts.*, users.name as user_name')
                 .order(created_at: :desc)
                 .page(params[:page])
                 .per(15)

    logger.debug @posts[0]
    respond_to do |format|
      format.html do
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

  def create
    @new_post = current_user.posts.build(post_params)
    unless @new_post.save
      flash.now[:alert] = 'There was a problem with submitting this post.'
      @posts = Post.all
    end
    render :main_feed
  end

  private

  def post_params
    params.require(:post).permit(:text, :user_id)
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
