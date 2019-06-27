# app/controllers/api/v1/merchants/revenue_controller.rb

class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: RevenueForGivenDateSerializer.new(InvoiceItem.revenue_on_given_date(revenue_params[:date]))
  end

  # private
  #
  def revenue_params
    params.permit(:date)
  end

end

# rails g serializer InvoiceItemZebraRevenue revenue

# InvoiceItem.joins(invoice: :transactions).select('SUM((invoice_items.quantity * invoice_items.unit_price)) AS revenue, CAST(invoices.updated_at AS varchar(10))').where("transactions.result = ? AND CAST(invoices.updated_at AS varchar(10)) LIKE ?", 'success', '2012-03-16%').group('CAST(invoices.updated_at AS varchar(10))')
