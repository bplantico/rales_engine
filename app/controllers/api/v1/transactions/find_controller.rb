# app/controllers/api/v1/transactions/find.rb

class Api::V1::Transactions::FindController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.find_all(transaction_params))
  end

  def show
    render json: TransactionSerializer.new(Transaction.find_by(transaction_params))
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end

end
