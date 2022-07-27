class Admin::BrandsController < ApplicationController
  def index
    @brands = Brand.all
    @brand = Brand.new
  end

  def show
    @brand = Brand.find(params[:id])
    @stores = @brand.stores.page(params[:page]).per(8)
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to admin_brands_path
    else
      redirect_to admin_brands_path, notice: 'ブランド名を入力してください'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to admin_brands_path, notice: 'ブランドを削除'
  end

  private

  def brand_params
    params.require(:brand).permit(:brand_id, :brand_name)
  end
end
