class HomesController < ApplicationController
  def top
  # サインインしていたら開かない，新規登録後飛べるように
    if user_signed_in?
      # && current_user.is_user == true
       redirect_to public_user_path(current_user)
    # elsif user_signed_in? && current_user.is_user == false
      # redirect_to  public_user_path(current_user)
    end
  end

end