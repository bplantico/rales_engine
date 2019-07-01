# app/serializers/invoice_serializer.rb

class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :customer_id, :merchant_id, :status

end
