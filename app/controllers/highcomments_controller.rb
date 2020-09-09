class HighcommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      highball = Highball.find(params[:highball_id])
      @highcomment = highball.highcomments.build(highcomment_params)
      @highcomment.user_id = current_user.id
      if @highcomment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
      before_action :correct_user,   only: :destroy
  
    def destroy
      @highcomment = Highcomment.find(params[:id])
      @highcomment.destroy
      flash[:success] = 'コメントを削除しました'
      redirect_to @highcomment.highball
    end
  
    private
  
      def highcomment_params
        params.require(:highcomment).permit(:highcomment)
      end
  
      def correct_user
        @highcomment = current_user.highcomments.find_by(id: params[:id])
        redirect_to root_url if @highcomment.nil?
      end
end
