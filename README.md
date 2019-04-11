# README

# Rubyのバージョン
2.3.1

# Railsのバージョン
5.0.7.2

# データベース設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|varchar(255)|null: false, |
|encrypted_password|varchar(255)|null:false|
|nickname|string|index: true, nill: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false|
|kana_last_name|string|null: false|
|postal_code|integer|null: false|
|state|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|inteer|null: false|
|profile_comment|text| |
|rate_id|integer| |
|custmer_id|string| |
|card_token|string| |
|uid|string| |
|provider|string| |
|point_id|integer| |

### Association
- has_many :products
- has_many :points
- has_many :rates
- has_many :liles, through: products
- has_many :comment, through: products
