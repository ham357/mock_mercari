# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times{
  nickname             = Faker::Games::Pokemon.name
  email                = Faker::Internet.email
  password = Faker::Internet.password(min_length = 6, max_length = 128)

  User.create!(nickname: nickname,
               email: email,
               password: password,
               password_confirmation: password)

}
  
(1..20).each do |n|
  gimei = Gimei.name
  address = Gimei.address

  first_name                  = Faker::Japanese::Name.first_name
  last_name                   = Faker::Japanese::Name.last_name
  kana_first_name             = gimei.first.katakana
  kana_last_name              = gimei.last.katakana
  postal_code                 = Faker::Address.postcode
  state                       = address.prefecture.to_s
  city                        = address.city.to_s
  address                     = address.town.to_s.to_s
  tel_number                  = Faker::PhoneNumber.phone_number
  birth_year                  = Faker::Number.between(1900, 2019)
  birth_month                 = Faker::Number.between(1, 12)
  birth_day                   = Faker::Number.between(1, 31)
  profile_comment             = Faker::Lorem.paragraph
  user_id                     = n
  
  UserInfo.create!(first_name: first_name,
                    last_name: last_name,
                    kana_first_name: kana_first_name,
                    kana_last_name: kana_last_name,
                    postal_code: postal_code,
                    state: state,
                    city: city,
                    address: address,
                    tel_number: tel_number,
                    birth_year: birth_year,
                    birth_month: birth_month,
                    birth_day: birth_day,
                    profile_comment: profile_comment,
                    user_id: user_id)
end

(1..10).each do |n|
  image_url          = "member_no_image.png"
  user_id            = n

  UserImage.create!(image_url: image_url,
    user_id: user_id)
end

(1..10).each do |n|
  rate          = Faker::Number.within(1..3)
  user_id       = 1
  rater_id      = n+1

  Rate.create!(rate: rate,
    user_id: user_id,
    rater_id: rater_id)
end


100.times{
  address = Gimei.address
  category   = %w[33 442 99 171]

  name                  = Takarabako.open
  status_id             = Faker::Number.within(1..5)
  shipping_fee          = Faker::Number.within(0..1)
  state                 = Faker::Number.within(1..47)
  shipping_method       = Faker::Number.within(0..3)
  shipping_day          = Faker::Number.within(1..3)
  price                 = Faker::Number.between(300, 100000)
  product_size_id       = Faker::Number.within(0..47)
  description           = Faker::Lorem.sentence
  category_id           = Faker::Number.within(1..300)
  brand_id              = Faker::Number.within(1..10)
  user_id               = Faker::Number.within(1..10)
  sold                  = Faker::Boolean.boolean

  Product.create(
    name: name,
    status_id: status_id,
    shipping_fee: shipping_fee,
    state: state,
    shipping_method: shipping_method,
    shipping_day: shipping_day,
    price: price,
    product_size_id: product_size_id,
    description: description,
    category_id: category_id,
    brand_id: brand_id,
    user_id: user_id,
    sold: sold)
  }

(1..100).each do |n|
  image_url          = File.open("#{Rails.root}/public/images/mock_image.jpg")
  product_id         = n

  ProductImage.create!(image_url: image_url,
    product_id: product_id)
end

(1..5).each do |n|
  comment       = Faker::Lorem.sentence
  user_id       = Faker::Number.within(1..3)
  product_id    = 1

  Comment.create!(comment: comment,
    user_id: user_id,
    product_id: product_id)
end


100.times{
  image_url          = File.open("#{Rails.root}/public/images/mock_image.jpg")
  product_id         = Faker::Number.between(1, 10)
  
  ProductImage.create!(image_url: image_url,
    product_id: product_id)
}
product_numbers = %w[4 6 8 10 1 3 5 7]
user_numbers = %w[3 5 7 9 10 2 4 6]
n = 0

  while n < 8 do
    product_id         = product_numbers[n]
    user_id            = user_numbers[n]
  
    Like.create!(product_id: product_id,
              user_id: user_id)
    n += 1
end

require "csv"

CSV.foreach('db/csv/brand_data.csv', headers: true) do |row|
  Brand.create(name: row['name']
                  )
end

CSV.foreach('db/csv/category_data.csv', headers: true) do |row|
  Category.create(
      name: row["name"],
      main_category_id: row["main_category_id"],
      sub_category_id: row["sub_category_id"],
      sub_subcategory_id: row["sub_subcategory_id"]
  )
end

CSV.foreach('db/csv/product_size_data.csv', headers: true) do |row|
  ProductSize.create(
      name: row["name"],
      size_category_id: row["size_category_id"]
  )
end
