class UsersController < ApplicationController

  def show
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
