class Admin::UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]

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

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end

  def user_params
    params.require(:user).permit(:email, :name, :name_kana, :nick_name, :brand_id, :store_id, :is_user, :profile_image)
  end
end
