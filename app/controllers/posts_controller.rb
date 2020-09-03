class PostsController < ApplicationController

    def index
      if params[:search] == nil
        @posts= Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        #部分検索
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
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
        redirect_to :action => "new"
      end
    end

    def search
      if params[:search] == nil
        @posts= Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        #部分検索
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
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
        redirect_to :action => "new"
      end
    end


    def destroy
      Post.find(params[:id]).destroy
      redirect_to action: :index
    end

    before_action :authenticate_user!, except: [:index]
    
    private

  def post_params
    params.require(:post).permit(:title,:body,:product,:maker,:rate,:image)
  end






end
