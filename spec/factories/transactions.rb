FactoryBot.define do
  factory :transaction do

    invoice

    sequence(:credit_card_number) { |n| (("#{n}".to_i)*1111111111111111).to_s }
    sequence(:credit_card_expiration_date) { |n| "#{n}".to_datetime }
    result { "success" }
  end
end
