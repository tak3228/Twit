class LikesController < ApplicationController
  before_action :set_tweet

  def create
    # バリデーションは不要なのでcreateを使用
    @like = Like.create(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def destroy
    # アソシエーションしているので@user.likesで該当ユーザのlikeレコードを取れる
    @like = current_user.likes.find_by(tweet_id: @tweet.id)
    @like.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
