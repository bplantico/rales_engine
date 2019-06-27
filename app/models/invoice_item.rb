class InvoiceItem < ApplicationRecord

  # relationships
  belongs_to :invoice
  belongs_to :item

  def self.revenue_on_given_date(date)
    InvoiceItem.joins(invoice: :transactions)
    .select('SUM((invoice_items.quantity * invoice_items.unit_price)) AS revenue, CAST(invoices.updated_at AS varchar(10))')
    .where("transactions.result = ? AND CAST(invoices.updated_at AS varchar(10)) LIKE ?", 'success', date + '%')
    .group('CAST(invoices.updated_at AS varchar(10))')
    .take
  end

end
