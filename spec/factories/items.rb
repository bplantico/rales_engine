FactoryBot.define do
  factory :item do

    merchant

    sequence(:name) { |n| "Item #{n} name" }
    sequence(:description) { |n| "Item #{n} description" }
    sequence(:unit_price) { |n| ("#{n}".to_i+1)*2 }
  end
end
