FactoryBot.define do

  factory :user_info do
    gimei = Gimei.name
    gimei_kanafirstname = gimei.first.katakana
    gimei_kanalastname = gimei.last.katakana
    gimei_address = Gimei.address
    gimei_state = gimei_address.prefecture.to_s
    gimei_city = gimei_address.city.to_s


    first_name                   { Faker::Japanese::Name.first_name }
    last_name                    { Faker::Japanese::Name.last_name }
    kana_first_name              { gimei_kanafirstname }
    kana_last_name               { gimei_kanalastname }
    postal_code                  { Faker::Address.postcode }
    state                        {"日本"}
    city                         { gimei_state}
    address                      { gimei_city }
    tel_number                   { Faker::PhoneNumber.phone_number }
    birth_year                   { Faker::Number.between(1900, 2019)}
    birth_month                  { Faker::Number.between(1, 12) }
    birth_day                    { Faker::Number.between(1, 31) }
    profile_comment              { Faker::Lorem.paragraph }
    user_id                      { Faker::Number.between(1, 30000) }
  end

end
