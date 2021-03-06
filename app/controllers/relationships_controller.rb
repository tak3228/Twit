class RelationshipsController < ApplicationController
  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
  end

  def destroy
    # アソシエーションしているので@user.relationshipsで該当ユーザのrelationshipsレコードを取れる
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
  end
end
