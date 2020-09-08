class HighballsController < ApplicationController

    def index
        if params[:search] != nil && params[:search] != ''
          @highballs = Highball.where("product LIKE ? ",'%' + params[:search] + '%') .or highball.where("maker LIKE ? ",'%' + params[:search] + '%') .or highball.where("body LIKE ? ",'%' + params[:search] + '%')
        else
          @highballs = Highball.all
        end
      end
  
      def new
        @highball = Highball.new
      end
  
      # 投稿
      def create
        @highball = Highball.new(highball_params)
        @highball.user_id = current_user.id
        if @highball.save
          redirect_to :action => "index"
        else
          render action: :new
        end
      end
  
      def search
        if params[:search] != nil && params[:search] != ''
          @highballs = Highball.where("product LIKE ? ",'%' + params[:search] + '%')
        else
          @highballs = Highball.all
        end
      end
  
      #update
  
      def show
        @highball = Highball.find(params[:id])
      end
  
      def edit
        @highball = Highball.find(params[:id])
      end
  
      def update
        @highball = Highball.find(params[:id])
        if @highball.update(highball_params)
          redirect_to :action => "show", :id => @highball.id
        else
          render action: :edit
        end
      end
  
  
      def destroy
        Highball.find(params[:id]).destroy
        redirect_to action: :index
      end
  
      #認証　投稿一覧と詳細は認証を外す
      before_action :authenticate_user!, except: [:index, :show]
      
      private
  
    def highball_params
      params.require(:highball).permit(:title,:body,:product,:maker,:rate,:alcohol,:image)
    end
  
  
  
  
  
  
  end