class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "保存しました"
     else
      render "edit"
     end
  end

  def destroy
    @user = User.find(params[:id])
    image = ActiveStorage::Attachment.find(@user.profile_image.id)
    image.purge
    @user.destroy
    redirect_to admin_users_path
  end


   private

  def user_params
    params.require(:user).permit(:email, :name, :name_kana, :nick_name, :brand_id, :store_id, :is_user, :profile_image)
  end
end
