class Public::CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.item_id = @item.id
    comment.save!
    @item.create_notification_comment!(current_user, @item.id)
    @comments = @item.comments.order("created_at DESC")
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @item = @comment.item
    @comment.destroy
    @comments = @item.comments.order("created_at DESC")
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :item_id, :user_id)
  end
end
