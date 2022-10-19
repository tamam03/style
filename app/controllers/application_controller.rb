class ApplicationController < ActionController::Base
 
  def log_in(user)
    session[:user_id] = user.id
  end

  # before_action :autheniticate_user
  # def autheniticate_user
  #   if current_user == nil
  #     flash[:notice] = "ログインが必要です"
  #     redirect_to root_path
  #   end
  # end
end
