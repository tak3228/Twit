class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show destroy]

  def index
    @tweets = Tweet.all.order('created_at DESC').page(params[:page]).per(20)
    @rt = Tweet.joins(:retweets).where(retweets: { user_id: current_user.id }).all.order('created_at DESC')
  end

  def new
    # エラー表示するために必要
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(text: tweet_params[:text], image: tweet_params[:image], user_id: current_user.id)
    if @tweet.save
      flash[:notice] = '投稿しました'
      redirect_to user_path(current_user.id)
    else
      render 'tweets/new'
    end
  end

  def destroy
    @tweet.destroy if @tweet.user_id == current_user.id
    flash[:notice] = '削除しました'
    redirect_to user_path(current_user.id)
  end

  def show
    @comments = @tweet.comments.includes(:user)
  end

  private

  # ストロングパラメータの許可
  def tweet_params
    params.require(:tweet).permit(:text, :image)
  end

  def set_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end
end
