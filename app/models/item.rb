class Item < ApplicationRecord

  # relationships
  belongs_to :merchant
  has_many :invoice_items

end
