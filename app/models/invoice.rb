class Invoice < ApplicationRecord

  # relationships
  belongs_to :customer
  belongs_to :merchant

  has_many :invoice_items
  has_many :items, through: :invoice_items

  has_many :transactions

end
