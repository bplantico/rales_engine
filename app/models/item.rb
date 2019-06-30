class Item < ApplicationRecord

  # relationships
  belongs_to :merchant
  has_many :invoice_items

  #class methods

  def self.most_items(quantity)
    if quantity.to_i >= 1
      joins(:invoice_items)
      .select('items.*, COUNT(invoice_items.id) AS instances')
      .group('items.id')
      .order('instances DESC')
      .limit(quantity)
    else
      joins(:invoice_items)
      .select('items.*, COUNT(invoice_items.id) AS instances')
      .group('items.id')
      .order('instances DESC')
    end
  end

  def self.most_revenue(quantity)
    if quantity.to_i >= 1
      joins(:invoice_items)
      .select('items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .group('items.id')
      .order('revenue DESC')
      .limit(quantity)
    else
      joins(:invoice_items)
      .select('items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .group('items.id')
      .order('revenue DESC')
    end
  end

  # instance methods

  def best_day
    Invoice.joins(invoice_items: [:item])
    .select('(invoice_items.quantity * invoice_items.unit_price) AS revenue, invoices.*')
    .where('items.id = ?', id)
    .order('revenue DESC, invoices.updated_at DESC')
    .limit(1)
    .take
  end

end
