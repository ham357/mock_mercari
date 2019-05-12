# README

## バージョン定義

### Rubyのバージョン
2.3.1
### Railsのバージョン
5.0.7.2

### 使用gem一覧
devise
active_hash
omniauth
omniauth-facebook
omniauth-google-oauth2
kaminari
ransack
capistrano
unicorn
haml-rails
font-awasome-rails
carrierwave
minni_magick
dropzone-rails
factory_bot
faker
capybara
rails-erd


# データベース設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null:false|
|nickname|string|index: true, nill: false, unique: true|
|custmer_id|string| |
|remember_created_at|datetime| |

### Association
- has_one :user_info, dependent: :destroy, class_name: User_info
- has_one :social_profile
- has_one :user_image
- has_many :products, dependent: :destroy,
- has_many :points
- has_many :rates, dependent: :destroy
- has_many :likes, through: products, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :product
- has_many :orders, through: products
- has_many :comments, through: products
- has_many :cards, dependent: destory


## user_infosテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false|
|kana_last_name|string|null: false|
|postal_code|integer|null: false|
|state|string|null: false|
|city|string|null: false|
|address|string|null: false|
|tel_number|integer|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|inteer|null: false|
|profile_comment|text| |
|user_id|string||

### Assotiaction
- belongs_to :user, optional: true

## user_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|string||
|user_id|integer|null: false|

### Assotiaction
- belongs_to :user, optional: true


## social_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|integer|null: false|
|access_token|string||
|access_secret|integer||
|user_id|integer|null: false|

### Assotiaction
- belongs_to :user


## ratesテーブル

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|user_id|integer|null: false|
|rater_it|integer|null: false|

### Association
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null :false|
|user_id|integer|null :false|

### Assosiation
- belongs_to :product
- belongs_to :user


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, length:{maximum: 40}|
|status_id|string|null: false|
|shipping_fee_id|integer|null: false|
|state_id|string|null: false|
|shipping_day_id|integer|null: false|
|shipping_method|integer|null: false|
|price|integer|null: false|
|size|string||
|description|text|null: false, length:{maximum: 1000}|
|category_id|integer|null: false|
|brand_id|integer||
|product_size_id|integer||
|user_id|integer||
|sold|boolean|default: false|
|create_at|datetime||
|update_at|datetime||

### Association
- belongs_to :user
- has_one :order
- has_one :product_size
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :product_images, dependent: :destroy


## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|text|null :false|
|product_id|integer|null :false|

### Assosiation
- belongs_to :product


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null :false, length:{maximum: 1000}|
|user_id|integer|null :false|
|product_id|integer|null: false|
|comment_deleted|boolean|default: false|

### Assosiation
- belongs_to :product
- belongs_to :user


## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user_id|integer|null: false|
|created_at|datetime||
|deadline_at|datetime||

### Association
- belongs_to :user


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|user_id|integer|null: false|
|point_id|integer||
|purchase_amount|string|null: false|
|convert_cash|boolean|default: false|
|payment_price|integer|null: false|
|point|integer||
|created_at|datetime||

### Association
- belongs_to :product
- belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|main_category_id|integer||
|sub_category_id|integer||
|sub_subcaterogy_id|integer||
|size_flg|boolean||
|brand_flg|boolean||
|product_size_id|integer||
|size_category_id|integer||

### Assosiation
- belongs_to :product


## Active_hash

- Prefecture
- Category
- Brand
- Status
- Product_shipping_fee
- Product_shipping_method
- Shippin_fee
- Shipping_day
- State
