class Public::CommentsController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.item_id = @item.id
    @comment.save
    redirect_to request.referer
    
  end
  
  def destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comments).permit(:text)   
  end
end
