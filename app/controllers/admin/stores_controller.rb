class Admin::StoresController < ApplicationController

  def index
    @stores = Store.all
    @store = Store.new
  end

  def create
    # binding.pry
     @store = Store.new(store_params)
     @store.save!
     redirect_to  request.referer

  end


   private


  def store_params
    params.require(:store).permit(:store_id, :store_name, :brand_id)
  end

end
