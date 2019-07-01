# app/controllers/api/v1/invoice_items/find.rb

class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
  end

    private

    def invoice_item_params
      params.permit(:id, :item_id, :invoice_id, :quantity)
    end

end
