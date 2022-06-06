class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @item = @user.items
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: "保存しました"
    else
      render "edit"
    end
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)
    @favorite_lists = Item.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :name_kana, :nick_name, :brand_id, :store_id, :is_user, :profile_image)
  end
end

