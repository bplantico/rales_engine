# app/controllers/api/v1/customers/favorite_merchant_controller.rb

class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    render json: MerchantSerializer.new(@customer.favorite_merchant)
  end

end
