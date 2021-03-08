class RetweetsController < ApplicationController
  before_action :set_tweet

  def create
    # バリデーションは不要なのでcreateを使用
    @retweet = Retweet.create(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def destroy
    # アソシエーションしているので@user.retweetsで該当ユーザのretweetレコードを取れる
    @retweet = current_user.retweets.find_by(tweet_id: @tweet.id)
    @retweet.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
