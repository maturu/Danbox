class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = "フォローしました"
    else
      flash[:alert] = "フォローに失敗しました"
    end
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = "フォローを解除しました"
    else
      flash[:alert] = "フォロー解除に失敗しました"
    end
  end

  private

    def set_user
      user = User.find(params[:follow_id])
    end
end
