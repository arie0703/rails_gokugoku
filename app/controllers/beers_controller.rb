class BeersController < ApplicationController

    def index
        if params[:search] != nil && params[:search] != ''
          @beers = Beer.where("product LIKE ? ",'%' + params[:search] + '%') .or Beer.where("maker LIKE ? ",'%' + params[:search] + '%') .or Beer.where("body LIKE ? ",'%' + params[:search] + '%')
        else
          @beers = Beer.all
        end
      end
  
      def new
        @beer = Beer.new
      end
  
      # 投稿
      def create
        @beer = Beer.new(beer_params)
        @beer.user_id = current_user.id
        if @beer.save
          redirect_to :action => "index"
        else
          render action: :new
        end
      end
  
      def search
        if params[:search] != nil && params[:search] != ''
          @beers = Beer.where("product LIKE ? ",'%' + params[:search] + '%')
        else
          @beers = Beer.all
        end
      end
  
      #update
  
      def show
        @beer = Beer.find(params[:id])
        @beerlike = Beerlike.new
        @beercomments = @beer.beercomments
        @beercomment = @beer.beercomments.build
      end
  
      def edit
        @beer = Beer.find(params[:id])
      end
  
      def update
        @beer = Beer.find(params[:id])
        if @beer.update(beer_params)
          redirect_to :action => "show", :id => @beer.id
        else
          render action: :edit
        end
      end
  
  
      def destroy
        Beer.find(params[:id]).destroy
        redirect_to action: :index
      end
  
      #認証　投稿一覧と詳細は認証を外す
      before_action :authenticate_user!, except: [:index, :show]
      
      private
  
    def beer_params
      params.require(:beer).permit(:title,:body,:product,:maker,:rate,:alcohol,:image)
    end
  
  
  
  
  
  
  end