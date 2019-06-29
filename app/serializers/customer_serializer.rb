# app/serializers/customer_serializer.rb

class CustomerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :first_name, :last_name
end
