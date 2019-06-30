# app/controllers/api/v1/merchants/favorite_customer_controller.rb

class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])

    render json: CustomerSerializer.new(@merchant.favorite_customer)
  end

end
