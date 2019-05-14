crumb :root do
  link "メルカリ", root_path
end

crumb :categories do
  link 'カテゴリー一覧', categories_path
end

crumb :category do|category|
  link "#{category.name}", category_path(category)
  parent :categories
end

crumb :brands do
  link 'ブランド一覧', brands_path
end

crumb :product do|product|
  link "#{product.name}", product_path(product)
end

crumb :mypage do|mypage|
  link 'マイページ', mypages_path(mypage)
end
