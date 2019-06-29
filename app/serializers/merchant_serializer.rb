# app/serializers/merchant_serializer.rb

class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
