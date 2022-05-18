class Public::CommentsController < ApplicationController

  def create
    # @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    @comment.item_id = params[:item_id]
    @comment.user_id = current_user.id
  # binding.pry
    @comment.save
    render :create
    # redirect_to request.referer

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
