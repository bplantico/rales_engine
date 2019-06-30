# app/controllers/api/v1/merchants/most_items_controller.rb

class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_items(merchant_params[:quantity]))
  end

  private

  def merchant_params
    params.permit(:quantity)
  end

end
