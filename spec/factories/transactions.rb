FactoryBot.define do
  factory :transaction do

    invoice

    sequence(:credit_card_number) { |n| (("#{n}".to_i)*1111111111111111).to_s }
    result { "success" }
  end
end
