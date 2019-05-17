require "csv"

CSV.foreach('db/csv/product_shipping_fee_data.csv', headers: true) do |row|
  ProductShippingFee.create(
      name: row["name"]
  )
end

CSV.foreach('db/csv/product_shipping_method_data.csv', headers: true) do |row|
  ProductShippingMethod.create(
      name: row["name"],
      shipping_fee_category: row["shipping_fee_category"]
  )
end

CSV.foreach('db/csv/brand_data.csv', headers: true) do |row|
  Brand.create(name: row['name']
                  )
end

CSV.foreach('db/csv/category_data.csv', headers: true) do |row|
  Category.create(
      name: row["name"],
      main_category_id:   row["main_category_id"],
      sub_category_id:    row["sub_category_id"],
      sub_subcategory_id: row["sub_subcategory_id"],
      pre_category_id:    row["pre_category_id"],
      pre_precategory_id: row["pre_precategory_id"]
  )
end

CSV.foreach('db/csv/product_size_data.csv', headers: true) do |row|
  ProductSize.create(
      name: row["name"],
      product_size_id: row["product_size_id"]
  )
end
