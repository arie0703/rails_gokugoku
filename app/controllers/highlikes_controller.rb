class HighlikesController < ApplicationController

    def create
        @highlike = current_user.highlikes.create(highball_id: params[:highball_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @highlike = Highlike.find_by(highball_id: params[:highball_id], user_id: current_user.id)
        @highlike.destroy
        redirect_back(fallback_location: root_path)
    end

end
