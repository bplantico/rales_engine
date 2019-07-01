# app/controllers/api/v1/invoice_items_controller.rb

class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.find_all(invoice_item_params))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end

end
