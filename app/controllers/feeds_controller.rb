class FeedsController < ApplicationController
    before_action :require_login
    def main_feed
        @posts = Post.all
        @post = Post.new
    end

    def create
        @new_post = current_user.posts.build(post_params)
        if @new_post.save
            render :main_feed
        else
            flash.now[:alert] = "There was a problem with submitting this post."
            @posts = Post.all
            render :main_feed 
        end
      end

    private
    def post_params
      params.require(:post).permit(:text, :user_id)
    end

    def require_login
        redirect_to login_path unless current_user
    end
end
