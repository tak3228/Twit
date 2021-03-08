class CommentsController < ApplicationController
  def create
    # createだとバリデーションにしにくいのでnew,saveを使用
    @comment = Comment.new(text: comment_params[:text],
                           tweet_id: comment_params[:tweet_id],
                           user_id: current_user.id)
    if @comment.save
      flash[:notice] = '投稿しました'
    else
      # renderが使えないのでflashで決め打ち
      flash[:alert] = '入力してください'
    end
    redirect_to "/tweets/#{@comment.tweet.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    flash[:notice] = '削除しました'
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private

  def comment_params
    params.permit(:text, :tweet_id)
  end
end
