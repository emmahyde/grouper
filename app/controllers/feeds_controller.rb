class FeedsController < ApplicationController
    before_action :require_login
    def main_feed
        @posts = Post.all
        @new_post = Post.new
    end

    def require_login
        redirect_to login_path unless current_user
      end
end
