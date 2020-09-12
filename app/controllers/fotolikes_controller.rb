class FotolikesController < ApplicationController

    def create
        @fotolike = current_user.fotolikes.create(foto_id: params[:foto_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @fotolike = Fotolike.find_by(foto_id: params[:foto_id], user_id: current_user.id)
        @fotolike.destroy
        redirect_back(fallback_location: root_path)
    end

end
