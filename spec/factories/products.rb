FactoryBot.define do

  factory :product do
    name                  { Takarabako.open }
    status_id             { Faker::Number.within(0..5) }
    shipping_fee_id          { Faker::Number.within(0..1) }
    state_id                 { Faker::Number.within(0..47) }
    shipping_method_id       { Faker::Number.within(0..3) }
    shipping_day_id          { Faker::Number.within(1..3) }
    price                 { Faker::Number.between(300, 100000) }
    description           { Faker::Lorem.sentence }
    category_id           { "33" }
    brand_id              { '7' }
    product_size_id       { Faker::Number.within(0..47) }
    sold                  { "false"  }
  end
  factory :other_product, class: Product do
    id                    {1}
    name                  { "あいうえお" }
    status_id             { 1 }
    shipping_fee_id          { 1 }
    state_id                 { 1 }
    shipping_method_id       { 1 }
    shipping_day_id          { 1 }
    price                 { 3000 }
    description           { "かきくけこ" }
    category_id           { 1 }
    brand_id              { 1 }
    user_id               { 1 }
    product_size_id       { 1 }
    sold                  { "false" }
  end

end
