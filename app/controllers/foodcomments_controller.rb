class FoodcommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      food = Food.find(params[:food_id])
      @foodcomment = food.foodcomments.build(foodcomment_params)
      @foodcomment.user_id = current_user.id
      if @foodcomment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
      before_action :correct_user,   only: :destroy
  
    def destroy
      @foodcomment = Foodcomment.find(params[:id])
      @foodcomment.destroy
      flash[:success] = 'コメントを削除しました'
      redirect_to @foodcomment.food
    end
  
    private
  
      def foodcomment_params
        params.require(:foodcomment).permit(:foodcomment)
      end
  
      def correct_user
        @foodcomment = current_user.foodcomments.find_by(id: params[:id])
        redirect_to root_url if @foodcomment.nil?
      end
  
end
