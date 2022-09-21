class Public::GuestSessionsController < ApplicationController

  def create
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric
      user.password_confirmation = user.password
      user.is_user = 'true'
      user.name = 'ゲスト'
      user.name_kana = 'ゲスト'
      user.nick_name = 'ゲスト'
    end
    sign_in user
    redirect_to public_items_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
