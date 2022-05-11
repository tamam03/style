class Public::ItemsController < ApplicationController

  def index
    @items = Item.all

  end

  # 非公開投稿一覧
  def privacy

    @close_items = current_user.items.where(status: "close")
    @items = @close_items.all

  end

  # 店舗スタッフのみ公開一覧
  def clerk
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to public_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @Item = Item.find(params[:id])
    @Item.destroy
    redirect_to  request.referer
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to public_item_path(item.id)
  end


  private

  def item_params
    params.require(:item).permit(:text, :brand_id, :status)
  end

end
