class Item < ApplicationRecord

  # relationships
  belongs_to :merchant
  has_many :invoice_items

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
