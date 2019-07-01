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

  def merchant_revenue(date = {})
    if date == nil
      Merchant.joins(invoices: [:invoice_items, :transactions])
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .where('transactions.result = ? AND merchants.id = ?', 'success', id)
      .group('merchants.id')
      .take
    else

      Merchant.joins(invoices: [:invoice_items, :transactions])
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .where('transactions.result = ? AND merchants.id = ? AND CAST(invoices.created_at AS varchar(10)) LIKE ?', 'success', id, date + '%')
      .group('merchants.id')
      .take
    end
  end

  def pending_customers
    Customer.find_by_sql(["SELECT customers.* FROM invoices LEFT JOIN customers ON invoices.customer_id = customers.id JOIN merchants ON invoices.merchant_id = merchants.id WHERE merchants.id = #{id} AND invoices.id NOT IN (SELECT transactions.invoice_id FROM transactions WHERE transactions.result = 'success')", 'customers.id'])

    # not working but close Customer.limit(10).joins('RIGHT JOIN invoices ON customers.id = invoices.customer_id JOIN merchants ON invoices.merchant_id = merchants.id LEFT JOIN transactions ON invoices.id = transactions.invoice_id').where.not('transactions.invoice_id IN ?', Transaction.select('invoice_id').where('result = ?', 'success'))
    # Transaction.joins(invoice: [:customer, :merchant]).select('customers.*').where.not(invoice_id: Transaction.select('invoice_id').where('result = ?', 'success')).where('merchants.id = ?', '17').select('customers.*').group('customers.id')
  end
end
