class Public::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def create
     binding.pry
    @item = Item.new(item_params)
    @item.save
    redirect_to public_items_path
  end

  def edit
  end


  private

  def item_params
    params.require(:item).permit(:text, :brand_id, :brand_name, :status, :user_id)
  end

end
