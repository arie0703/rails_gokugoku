class FotocommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      foto = Foto.find(params[:foto_id])
      @fotocomment = foto.fotocomments.build(fotocomment_params)
      @fotocomment.user_id = current_user.id
      if @fotocomment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
      before_action :correct_user,   only: :destroy
  
    def destroy
      @fotocomment = Fotocomment.find(params[:id])
      @fotocomment.destroy
      flash[:success] = 'コメントを削除しました'
      redirect_to @fotocomment.foto
    end
  
    private
  
      def fotocomment_params
        params.require(:fotocomment).permit(:fotocomment)
      end
  
      def correct_user
        @fotocomment = current_user.fotocomments.find_by(id: params[:id])
        redirect_to root_url if @fotocomment.nil?
      end
  
end
