class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts = current_user.posts.order(created_at: :desc)
    end
  end
end
