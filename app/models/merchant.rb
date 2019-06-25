class Merchant < ApplicationRecord

  # relationships
  has_many :items
  has_many :invoices

end
