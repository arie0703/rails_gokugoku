class FoodlikesController < ApplicationController

    def create
        @foodlike = current_user.foodlikes.create(food_id: params[:food_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @foodlike = Foodlike.find_by(food_id: params[:food_id], user_id: current_user.id)
        @foodlike.destroy
        redirect_back(fallback_location: root_path)
    end

end
