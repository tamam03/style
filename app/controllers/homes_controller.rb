class HomesController < ApplicationController
  def top
    if user_signed_in?
       redirect_to public_user_path(current_user)
    end
  end
  
  def about
  end

end