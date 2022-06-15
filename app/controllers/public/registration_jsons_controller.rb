class Public::RegistrationJsonsController < ApplicationController
  def get_store
    render json: Store.where(brand_id: params[:brand_id])
  end
end
