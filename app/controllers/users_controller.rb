class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(2).order('updated_at DESC')
    @fotos = @user.fotos.page(params[:page]).per(6)
  end

  def followings
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  def all_posts
    @user = User.find(params[:id])
  end

  def all_fotos
    @user = User.find(params[:id])
  end

  def all_likes
    @user = User.find(params[:id])
  end

  def all_fotolikes
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  before_action :authenticate_user!


  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
