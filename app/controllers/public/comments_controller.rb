class Public::CommentsController < ApplicationController

  def create
    # @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    @comment.item_id = params[:item_id]
    @comment.user_id = current_user.id
    # binding.pry
    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました。"
      render :index
    else
      flash.now[:alert] ="コメントの投稿に失敗しました。"
      render :index
      
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    render :index
  end


  private

  def comment_params
    params.require(:comment).permit(:text, :item_id, :user_id)
  end
end
