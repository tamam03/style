class Public::CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user_id = current_user.id
    # @comment.item_id = @item.id
  # binding.pry
    # @comment.save
    redirect_to request.referer

  end

  def destroy
    # @comment = Comment.find(params[:id])
    # @comment.destroy
    # redirect_to request.referer
  end


  private

  def comment_params
    params.require(:comment).permit(:text, :item_id, :user_id)
  end
end
