class Admin::CommentsController < ApplicationController

 def destroy
    # item = Item.find(params[:id])
    comment = Comment.find(params[:comment_id])
    comment.destroy
    redirect_to admin_items_path
 end

  private

  def comment_params
    params.require(:comment).permit(:text, :item_id, :user_id)
  end

end
