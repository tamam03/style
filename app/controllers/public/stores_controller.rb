class Public::StoresController < ApplicationController
  def index
     brand = Brand.find(params[:brand_id])
     render json: brand.stores.select(:id, :store_name)
  end

     private


  def store_params
    params.require(:store).permit(:store_id, :store_name, :brand_id)
  end
end
