# README

#バージョン定義

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
- has_many :comment, through: products


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
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
|introduct|text|null: false|
|user_id|integer||
|order_item_id|integer||
|sold|boolean|default: false|
|create_at|datetime||
|update_at|datetime||

### Association
- belongs_to :user
- has_many :order_items
- has_many :comments
- has_many :likes
- has_many :product_images


