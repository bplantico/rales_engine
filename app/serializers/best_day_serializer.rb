# app/serializers/best_day_serializer.rb

class BestDaySerializer
  include FastJsonapi::ObjectSerializer

  attributes :best_day do |object|
    object.created_at.to_s.slice(0, 10)
  end
end
