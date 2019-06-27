# app/controllers/api/v1/merchants/most_revenue_controller.rb

class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(revenue_params[:quantity]))
  end
  
  private

  def revenue_params
    params.permit(:quantity)
  end

end
