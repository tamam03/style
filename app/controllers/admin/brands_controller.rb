class Admin::BrandsController < ApplicationController


  def index
    @brands = Brand.all
    @brand = Brand.new
  end
  
  def show
    @brand = Brand.find(params[:id])
  end

  def create
     @brand = Brand.new(brand_params)
     @brand.save!
     redirect_to  request.referer
  end
  
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to  request.referer
  end
  

   private


  def brand_params
    params.require(:brand).permit(:brand_id, :brand_name)
  end

end
