class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts = Post.order(created_at: :desc).limit(6)
      @popular_posts = Post.order('likes_count desc').limit(6)
      @post_like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(6).pluck(:post_id))
    end
  end
end
