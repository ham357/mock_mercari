FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkke@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    # association :user_infos, factory: :user_info

  #   after(:create) do |user|
  #     create_list(:user_info, 1, user: user)
  #   end
  end

end
