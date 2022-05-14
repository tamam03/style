class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :name_kana, :nick_name, :brand_id, :store_id, :is_user)
  end
end

