class Public::ItemsController < ApplicationController
  def index
  end

  def show
  end
  
  def create
  end
  
  def edit
  end
  
  
  private
  
  def item_params
    params.require(:items).permit(:text, :status, :brand_id, :user_id)
  end
  
end
