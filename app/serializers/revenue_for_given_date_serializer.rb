class RevenueForGivenDateSerializer
  include FastJsonapi::ObjectSerializer

  attribute :total_revenue do |object|
    ((object.revenue.to_f)/100).to_s
  end
end
