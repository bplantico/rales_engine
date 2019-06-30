# app/serializers/merchant_revenue_serializer.rb

class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer

  attribute :revenue do |object|
    ((object.revenue.to_f)/100).to_s
  end
end
