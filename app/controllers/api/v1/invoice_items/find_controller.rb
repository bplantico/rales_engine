# app/controllers/api/v1/invoice_items/find.rb

class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    if invoice_item_params[:unit_price].nil?
      render json: InvoiceItemSerializer.new(InvoiceItem.find_all(invoice_item_params))
    else
      unformatted_price = invoice_item_params[:unit_price]
      db_formatted_price = ((unformatted_price.to_f*100).round(0))
      render json: InvoiceItemSerializer.new(InvoiceItem.find_all(unit_price: db_formatted_price))
    end
  end


  def show
    if invoice_item_params[:unit_price].nil?
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
    else
      unformatted_price = invoice_item_params[:unit_price]
      db_formatted_price = ((unformatted_price.to_f*100).round(0))
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(unit_price: db_formatted_price))
    end
  end

    private

    def invoice_item_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end

end
