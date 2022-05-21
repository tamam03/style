class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
   @item = Item.find(params[:id])
  end
  
  def user_index
    @user = User.find(params[:id])
    @items = @user.items
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:text, :brand_id, :status, :item_image)
  end
end
