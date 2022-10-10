class Admin::StoresController < ApplicationController
  def index
    @stores = Store.all
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_brand_path(@store.brand.id)
    else
      redirect_to admin_stores_path, notice: 'ブランド名を入力してください'
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to request.referer
  end

  private

  def store_params
    params.require(:store).permit(:store_id, :store_name, :brand_id)
  end
end
