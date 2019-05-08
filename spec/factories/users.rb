FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length = 6, max_length = 128)
    nickname              { Faker::Games::Pokemon.name }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
  end
  factory :other_user,class: User do
    password = Faker::Internet.password(min_length = 6, max_length = 128)
    id                    {1}
    nickname              { Faker::Games::Pokemon.name }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
  end
end
