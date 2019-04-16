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
|custmer_id|string| |
|card_token|string| |
|uid|string| |
|provider|string| |

### Association
- has_one :user_info, dependent: :destroy, class_name: User_info
- has_many :products
- has_many :points
- has_many :rates
- has_many :likes, through: products
- has_many :orders, through: products
- has_many :comments, through: products


## user_infoテーブル

|Column|Type|Options|
|------|----|-------|
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
|user_id|string||
|created_at|datetime||
|update_at|datetime||

### Assotiaction
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, length:{maximum: 40}|
|status|string|null: false|
|shipping_fee|integer|null: false|
|state|string|null: false|
|shipping_day|integer|null: false|
|price|integer|null: false|
|size|string||
|description|text|null: false, length:{maximum: 1000}|
|user_id|integer||
|sold|boolean|default: false|
|create_at|datetime||
|update_at|datetime||

### Association
- belongs_to :user
- has_one :order
- has_one :category
- has_one :subcategory
- has_one :subsubcategory
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :product_images


## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user_id|integer|null: false|
|created_at|datetime||
|deadline_at|datetime||

### Association
- belongs_to :user


## ratesテーブル

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
- belongs_to :product
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
|product_id|integer|null :false|

### Assosiation
- belongs_to :product


## subcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|product_id|integer|null :false|

### Assosiation
- belongs_to :product


## subsubcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|product_id|integer|null :false|

### Assosiation
- belongs_to :product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|product_id|integer|null :false|

### Assosiation
- belongs_to :product
