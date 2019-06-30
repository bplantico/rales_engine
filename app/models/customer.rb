class Customer < ApplicationRecord

  # relationships
  has_many :invoices

  # instance methods

  def favorite_merchant
    Merchant.joins(invoices: [:customer, :transactions])
    .select('COUNT(transactions.id) AS transacts, merchants.*')
    .where('transactions.result = ? AND customers.id = ?', 'success', id)
    .group('merchants.id')
    .order('transacts DESC')
    .limit(1)
    .take

  end

end
