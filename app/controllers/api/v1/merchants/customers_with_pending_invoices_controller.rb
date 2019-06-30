# app/controllers/api/v1/merchants/customers_with_pending_invoices_controller.rb

class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def show
    @merchant = Merchant.find(merchant_params[:id])
    render json: CustomerSerializer.new(@merchant.pending_customers)
  end

  private

  def merchant_params
    params.permit(:id)
  end

end
