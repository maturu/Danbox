class StaticPagesController < ApplicationController

  def about
  end

  def help
  end

  def contact
  end

  def terms
  end

  def privacy_policy
  end

  def modal
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def card
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
