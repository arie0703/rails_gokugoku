class FoodsController < ApplicationController

    def index
        if params[:search] != nil && params[:search] != ''
          @foods = Food.where("product LIKE ? ",'%' + params[:search] + '%') .or food.where("maker LIKE ? ",'%' + params[:search] + '%') .or food.where("body LIKE ? ",'%' + params[:search] + '%')
        else
          @foods = Food.all
        end
      end
  
      def new
        @food = Food.new
      end
  
      # 投稿
      def create
        @food = Food.new(food_params)
        @food.user_id = current_user.id
        if @food.save
          redirect_to :action => "index"
        else
          render action: :new
        end
      end
  
      def search
        if params[:search] != nil && params[:search] != ''
          @foods = Food.where("product LIKE ? ",'%' + params[:search] + '%')
        else
          @foods = Food.all
        end
      end
  
      #update
  
      def show
        @food = Food.find(params[:id])
        @foodlike = Foodlike.new
        @foodcomments = @food.foodcomments
        @foodcomment = @food.foodcomments.build
      end
  
      def edit
        @food = Food.find(params[:id])
      end
  
      def update
        @food = Food.find(params[:id])
        if @food.update(food_params)
          redirect_to :action => "show", :id => @food.id
        else
          render action: :edit
        end
      end
  
  
      def destroy
        Food.find(params[:id]).destroy
        redirect_to action: :index
      end
  
      #認証　投稿一覧と詳細は認証を外す
      before_action :authenticate_user!, except: [:index, :show]
      
      private
  
    def food_params
      params.require(:food).permit(:title,:body,:image)
    end
  
  
  
  
  
  
  end