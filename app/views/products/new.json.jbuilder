json.category do
  if @categories.present?
      json.array! @categories do |category|
        json.id                   category.id
        json.name                 category.name
        json.main_category_id     category.main_category_id
        json.sub_category_id      category.sub_category_id
        json.sub_subcategory_id   category.sub_subcategory_id
        json.size_flg             category.size_flg
        json.size_category_id     category.size_category_id
        json.brand_flg            category.brand_flg
      end
    end
  end
json.size_category do
  if @product_sizes.present?
    json.array! @product_sizes do |product_size|
      json.id                   product_size.id
      json.name                 product_size.name
    end
  end
end

json.shipping_method do
  if @product_shipping_methods.present?
    json.array! @product_shipping_methods do |product_shipping_method|
      json.id                   product_shipping_method.id
      json.name                 product_shipping_method.name
    end
  end
end