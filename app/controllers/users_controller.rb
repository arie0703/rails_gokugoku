class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(2).order('updated_at DESC')
    @fotos = @user.fotos.page(params[:page]).per(6)
  end

  def allposts
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(2).order('updated_at DESC')
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
