FactoryBot.define do
  factory :customer do
    sequence(:first_name) { |n| "User_#{n} First" }
    sequence(:last_name) { |n| "User_#{n} Last" }
  end
end
