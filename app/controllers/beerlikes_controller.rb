class BeerlikesController < ApplicationController

    def create
        @beerlike = current_user.beerlikes.create(beer_id: params[:beer_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @beerlike = Beerlike.find_by(beer_id: params[:beer_id], user_id: current_user.id)
        @beerlike.destroy
        redirect_back(fallback_location: root_path)
    end

end
