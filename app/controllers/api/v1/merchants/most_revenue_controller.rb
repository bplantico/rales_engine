# app/controllers/api/v1/merchants/most_revenue_controller.rb

class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(merchant_params[:quantity]))
  end

  private

  def merchant_params
    params.permit(:quantity)
  end

end
