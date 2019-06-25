class InvoiceItem < ApplicationRecord

  # relationships
  belongs_to :invoice
  belongs_to :item
  
end
