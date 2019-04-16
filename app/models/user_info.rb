class UserInfo < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :kana_first_name,:kana_last_name, :birth_year, :birth_month, :birth_day, presence: true, length: { maximum: 35 }
end
