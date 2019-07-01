# app/controllers/api/v1/invoices_controller.rb

class Api::V1::InvoicesController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.find_all(invoice_params))
  end

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(invoice_params))
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status)
  end

end
