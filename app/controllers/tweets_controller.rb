class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order('created_at DESC').page(params[:page]).per(20)
  end

  def new; end

  def create
    Tweet.create!(text: tweet_params[:text], user_id: current_user.id)
    flash[:notice] = '投稿しました'
    redirect_to user_path(current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    flash[:notice] = '削除しました'
    redirect_to user_path(current_user.id)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private

  # ストロングパラメータの許可
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
