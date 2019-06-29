# app/controllers/api/v1/merchants/revenue_controller.rb

class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: TotalRevenueSerializer.new(InvoiceItem.revenue_on_given_date(revenue_params[:date]))
  end

  private

  def revenue_params
    params.permit(:date)
  end

end
