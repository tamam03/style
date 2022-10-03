class HomesController < ApplicationController
  def top
    if user_signed_in?
      redirect_to public_user_path(current_user)
    end

    @new_items = Item.where(status: "release", user: User.where(is_user: false)).limit(6).order("created_at DESC")

  end


end
