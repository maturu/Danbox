class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :destroy]

  def index
    @users = User.all
    @posts = Post.all.order('id DESC')
    @post = Post.new
    @comments = Comment.all
    @comment = Comment.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = params[:post][:caption].length > 140 ? "見出しは140文字以内で入力してくだい" : "投稿する画像を選択してください"
      redirect_back(fallback_location: root_path) 
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
      params.require(:post).permit(:content, :content_cache, :remove_content, :caption)
    end
end
