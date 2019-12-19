class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    unless @comment.save
      flash[:alert] = "コメントは70文字以内で入力してください"
      redirect_to root_path
    end
    @comments = Comment.where(post_id: params[:post_id]).order("id DESC")
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
