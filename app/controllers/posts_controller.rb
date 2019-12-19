class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :destroy]

  def index
    @posts = Post.all.order('id DESC')
    @post = Post.new
    respond_to do |format|
      format.html
      format.json { 
        @new_post = Post.where('id > ?', params[:id])
        @new_comment = Comment.where('id > ? and post_id = ?', params[:comment_id], params[:post_id])
        @comment_user = User.where(id: @new_comment.select("user_id"))
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @relationships = Relationship.where(follow_id: @user.id)
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
    redirect_to show_path(id: current_user.id)
  end

  protected
    def post_params
      params.require(:post).permit(:content, :content_cache, :remove_content, :caption)
    end
end
