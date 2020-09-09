class BeercommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    beer = Beer.find(params[:beer_id])
    @beercomment = beer.beercomments.build(beercomment_params)
    @beercomment.user_id = current_user.id
    if @beercomment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

    before_action :correct_user,   only: :destroy

  def destroy
    @beercomment = Beercomment.find(params[:id])
    @beercomment.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_to @beercomment.beer
  end

  private

    def beercomment_params
      params.require(:beercomment).permit(:beercomment)
    end

    def correct_user
      @beercomment = current_user.beercomments.find_by(id: params[:id])
      redirect_to root_url if @beercomment.nil?
    end

end