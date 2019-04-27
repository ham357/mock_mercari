if @categories.present?
  json.array! @categories do |category|
    json.id  category.id
    json.name  category.name
    json.main_category_id  category.main_category_id
    json.sub_category_id  category.sub_category_id
    json.sub_subcategory_id  category.sub_subcategory_id
  end
end