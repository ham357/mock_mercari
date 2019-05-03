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
    category_id           { Faker::Number.within(0..47) }
    brand_id              { Faker::Number.within(0..47) }
    user_id               { Faker::Number.within(0..47) }
    product_size_id       { Faker::Number.within(0..47) }
    sold                  { Faker::Boolean.boolean }
  end
  factory :other_product, class: Product do
    id                    {1}
    name                  { "あいうえお" }
    status                { 1 }
    shipping_fee          { 1 }
    state                 { 1 }
    shipping_method       { 1 }
    shipping_day          { 1 }
    price                 { 3000 }
    description           { "かきくけこ" }
    category_id           { 1 }
    brand_id              { 1 }
    user_id               { 1 }
    product_size_id       { 1 }
    sold                  { "false" }
  end

end
