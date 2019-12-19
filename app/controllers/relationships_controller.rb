class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    unless following.save
      flash[:alert] = "フォローに失敗しました"
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    unless following.destroy
      flash[:alert] = "フォロー解除に失敗しました"
      redirect_to root_path
    end
  end

  private

    def set_user
      user = User.find(params[:follow_id])
    end
end
