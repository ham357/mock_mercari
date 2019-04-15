FactoryBot.define do

  factory :user_info do
    first_name                   {"坂田"}
    last_name                    {"稔"}
    kana_first_name              {"サカタ"}
    kana_last_name               {"ミノル"}
    postal_code                  {"2850085"}
    state                        {"日本"}
    city                         {"東京"}
    adress                       {"千葉県佐倉市"}
    tel_number                   {"09054090990"}
    birth_year                   {"1900"}
    birth_month                  {"12"}
    birth_day                    {"12"}
    profile_comment              {"こんにちは"}
    user_id                      {"100"}
    created_at                   {"2019-02-17 00:00:00"}
    update_at                   {"2019-02-17 00:00:00"}
  end

end
