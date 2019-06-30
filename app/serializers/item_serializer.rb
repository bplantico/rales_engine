# app/serializers/item_serializer.rb

class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
