class UsersController < ApplicationController
  before_action :set_target_user, only: %i[show edit update likes]
  before_action :correct_user_page, only: %i[edit likes]
  before_action :require_user_logged_in?, only: %i[show edit update likes]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def likes
    @posts = @user.posts
    @like_posts = @user.like_posts
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :profile)
  end 

  def set_target_user
    @user = User.find(params[:id])
  end

  def correct_user_page
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
