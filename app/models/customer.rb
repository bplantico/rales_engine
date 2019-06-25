class Customer < ApplicationRecord

  # relationships
  has_many :invoices

end
