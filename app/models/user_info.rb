class UserInfo < ApplicationRecord
  belongs_to :user, optional: true
  # フォームにvalidateを書ける(sns登録を有効にするため)
  # validates :first_name,:last_name,:kana_first_name,:kana_last_name,  presence: true,  length: { maximum: 35 }
  # validates :birth_year, :birth_month, :birth_day, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
end
