FactoryBot.define do

  factory :product do
    name                  { Takarabako.open }
    status                { Faker::Number.within(0..5) }
    shipping_fee          { Faker::Number.within(0..1) }
    state                 { Faker::Number.within(0..47) }
    shipping_method       { Faker::Number.within(0..3) }
    shipping_day          { Faker::Number.within(0..2) }
    price                 { Faker::Number.between(300, 9999999) }
    description           { Faker::Lorem.sentence }
    size                  {}
    user
    sold                  { Faker::Boolean.boolean }
  end

end
