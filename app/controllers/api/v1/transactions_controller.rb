# app/controllers/api/v1/transactions_controller.rb

class Api::V1::TransactionsController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.find_all(transaction_params))
  end

  def show
    render json: TransactionSerializer.new(Transaction.find_by(transaction_params))
  end

  private

  def transaction_params
    params.permit(:id, :invoices_id, :credit_card_number, :result, :created_at, :updated_at)
  end

end
