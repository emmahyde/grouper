class FeedsController < ApplicationController
    def main_feed
        @posts = Post.all
        @new_post = Post.new
    end
end
