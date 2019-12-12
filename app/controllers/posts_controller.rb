class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :destroy]

  def index
    @posts = Post.all.order('id DESC')
    @post = Post.new
  end

  def show
    @posts = Post.where(user_id: current_user.id).order('id DESC')
  end

  def create
    if !!post_params
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path) 
      end
    else
      flash[:alert] = "投稿する画像を選択してください"
      redirect_to root_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
    redirect_to show_path
  end

  protected
    def post_params
      params.require(:post).permit(:content, :content_cache, :remove_content) if !!params[:post]
    end
end
