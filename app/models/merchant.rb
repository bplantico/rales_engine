class Merchant < ApplicationRecord

  # relationships

  has_many :items
  has_many :invoices

  # class methods

  def self.most_revenue(quantity)
    if quantity.to_i >= 1
      joins(invoices: :invoice_items)
        .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
        .group("merchants.id")
        .order("revenue DESC")
        .limit(quantity)
      else
        joins(invoices: :invoice_items)
          .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
          .group("merchants.id")
          .order("revenue DESC")
      end
  end

  def self.most_items(quantity)
    if quantity.to_i >= 1
      joins(invoices: [:transactions, :invoice_items])
        .select('merchants.*, SUM(invoice_items.quantity) AS total_items')
        .where('transactions.result = ?', 'success')
        .group('merchants.id').order('total_items DESC')
        .limit(quantity)
    else
      joins(invoices: [:transactions, :invoice_items])
        .select('merchants.*, SUM(invoice_items.quantity) AS total_items')
        .where('transactions.result = ?', 'success')
        .group('merchants.id').order('total_items DESC')
    end
  end

  # instance methods

  def favorite_customer
    Customer.joins(invoices: [:merchant, :transactions])
    .where('transactions.result = ? AND merchants.id = ?', 'success', self.id)
    .select('customers.*, COUNT(transactions.id) AS num_transacts')
    .group('customers.id')
    .order('num_transacts DESC')
    .limit(1).take
  end
end
