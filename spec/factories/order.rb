FactoryBot.define do

  factory :order do
    purchase_amount {Faker::Number.between(10000000000000, 90000000000000)}
    payment_price   {Faker::Number.between(500,30000)}
  end

end
