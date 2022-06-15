class Public::ItemsController < ApplicationController
  # before_action :ensure_user, only: [:privacy, :clerk, :edit, :update, :destroy ]
  before_action :search_items

  def search
    @results = @d.result.where(status: "release").page(params[:page]).per(9)
    @brands = Brand.all
  end

  def index
    @items = Item.where(status: "release").page(params[:page]).per(9)
    @user = User.select("is_user")
  end

  # ログインユーザー投稿履歴一覧
  def my_item
    @my_items = Item.where(user_id: current_user.id).includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end

  # ログインユーザー非公開設定投稿一覧
  def privacy
    @close_items = current_user.items.where(status: "close").page(params[:page]).per(9)
  end

  # 店舗スタッフのみ設定公開一覧
  def clerk
    @clerk_items = Item.all.where(status: "only_clerk").page(params[:page]).per(9)
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    tag_list = params[:item][:tag_name].split(" ")
    @item.save
    @item.save_tag(tag_list)
    redirect_to public_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to public_items_path, notice: '投稿を削除しました'
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

  def search_items
    @d = Item.ransack(params[:q])
  end
end
