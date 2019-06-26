FactoryBot.define do
  factory :merchant do
    sequence(:name) {  |n| "Merchant #{n} Name" }
  end
end
