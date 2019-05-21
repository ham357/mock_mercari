json.category do
  if @categories.present?
    json.array! @categories do |category|
      json.id                   category.id
      json.name                 category.name
      json.main_category_id     category.main_category_id
      json.sub_category_id      category.sub_category_id
      json.sub_subcategory_id   category.sub_subcategory_id
      json.size_flg             category.size_flag
      json.product_size_id     category.product_size_id
      json.brand_flg            category.brand_flag
    end
  end
end

json.product_sizes do
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

json.new_product do
  if @new_product.present?
      json.id                   @new_product.ids
  end
end

