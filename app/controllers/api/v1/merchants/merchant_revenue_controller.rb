# app/controllers/api/v1/merchants/merchant_revenue_controller.rb

class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def show
    @merchant = Merchant.find(merchant_revenue_params[:id])
    render json: MerchantRevenueSerializer.new(@merchant.merchant_revenue(merchant_revenue_params[:date]))
  end

  private

  def merchant_revenue_params
    params.permit(:id, :date)
  end

end
