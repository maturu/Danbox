class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :destroy]
  before_action :twitter_client, only: [:create]

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
      @client.update("#{@post.caption}\r #{root_url}/modal?id=#{@post.id}")
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

  private
    def twitter_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_API_KEY']
        config.consumer_secret = ENV['TWITTER_API_SECRET']
        config.access_token = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end
end
