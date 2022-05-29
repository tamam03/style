class Public::ItemsController < ApplicationController
# before_action :ensure_user, only: [:privacy, :clerk, :edit, :update, :destroy ]

  def index
    @items = Item.where!(status: "release").page(params[:page]).per(8)
    @user = User.select("is_user")
  end

  # ログインユーザー投稿一覧
  def my_item
    @my_items = Item.where(user_id: current_user.id).includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  # ログインユーザー非公開投稿一覧
  def privacy
    @close_items = current_user.items.where(status: "close").page(params[:page]).per(8)
  end

  # 店舗スタッフのみ公開一覧
  def clerk
    @clerk_items = Item.all.where(status: "only_clerk").page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
    # binding.pry
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save!
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
    params.require(:item).permit(:text, :brand_id, :status, :item_image)
  end

end



