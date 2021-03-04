class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show users_tweets show_tweets]
  before_action :exists_user?, only: ['show']

  def index
    @users = User.all
  end

  def show
    # 自身のツイートのみを抽出
    @tweets = Tweet.where(user_id: @user.id).all.order('created_at DESC').page(params[:page]).per(20)
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def exists_user?
    redirect_to root_path if @user.nil?
  end
end

# テーブルにデータを保存させるには
# 1.newメソッドでUserモデルのインスタンスを作成
# 2.saveメソッドでuserテーブルに保存
