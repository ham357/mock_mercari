# README

## バージョン定義

### Rubyのバージョン
2.3.1
### Railsのバージョン
5.0.7.2

# データベース設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|varchar(255)|null: false|
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
- has_many :orders, through: products
- has_many :comment, through: products


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, length:{maximum: 40}|
|category_id|integer|null: false|
|subcategory_id|integer|null: false|
|subsubcategory_id|integer|null: false|
|brand_id|integer||
|status|string|null: false|
|shipping_fee|integer|null: false|
|state|string|null: false|
|shipping_day|integer|null: false|
|price|integer|null: false|
|size|string||
|product_image_id|integer|null: false|
|description|text|null: false, length:{maximum: 1000}|
|user_id|integer||
|order_item_id|integer||
|sold|boolean|default: false|
|create_at|datetime||
|update_at|datetime||

### Association
- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :product_images


## pointテーブル

|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user_id|integer|null: false|
|created_at|datetime||
|deadline_at|datetime||

### Association
- belongs_to :user


## rateテーブル

|Column|Type|Options|
|------|----|-------|
|rate|string|null: false|
|user_id|integer|null: false|
|rated_it|integer|null: false|
|created_at|datetime||
|update_at|datetime||

### Association
- belongs_to :user


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer||
|user_id|integer||
|point_id|integer||
|convert_cash|boolean|default: false|
|created_at|datetime||

### Association
- has_one :product
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null :false, length:{maximum: 1000}|
|user_id|integer|null :false|
|product_id|integer|null: false|
|created_at|datetime||
|update_at|datetime||

### Assosiation
- belongs_to :product
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null :false|
|user_id|integer|null :false|

### Assosiation
- belongs_to :product
- belongs_to :user


## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|text|null :false|
|product_id|integer|null :false|

### Assosiation
- belongs_to :product


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||


## subcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||


## subsubcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
