class PostsController < ApplicationController

    def index
      if params[:search] != nil && params[:search] != ''
        @posts = Post.where("product LIKE ? ",'%' + params[:search] + '%') .or Post.where("maker LIKE ? ",'%' + params[:search] + '%') .or Post.where("body LIKE ? ",'%' + params[:search] + '%')
      else
        @posts = Post.all
      end
    end

    def new
      @post = Post.new
    end

    # 投稿
    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_to :action => "index"
      else
        render action: :new
      end
    end

    def search
      if params[:search] != nil && params[:search] != ''
        @posts = Post.where("product LIKE ? ",'%' + params[:search] + '%')
      else
        @posts = Post.all
      end
    end

    #update

    def show
      @post = Post.find(params[:id])
      @like = Like.new
      @comments = @post.comments
      @comment = @post.comments.build
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to :action => "show", :id => @post.id
      else
        render action: :edit
      end
    end


    def destroy
      Post.find(params[:id]).destroy
      redirect_to action: :index
    end

    #認証　投稿一覧と詳細は認証を外す
    before_action :authenticate_user!, except: [:index, :show]
    
    private

  def post_params
    params.require(:post).permit(:title,:body,:product,:maker,:rate,:alcohol,:image)
  end






end
