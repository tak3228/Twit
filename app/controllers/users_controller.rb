class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(:id => params[:id])
  end
end

# テーブルにデータを保存させるには
# 1.newメソッドでUserモデルのインスタンスを作成
# 2.saveメソッドでuserテーブルに保存
