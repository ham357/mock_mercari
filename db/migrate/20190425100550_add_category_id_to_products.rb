class AddCategoryIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products,
     :product_size_id, :integer
    add_column :products, :category_id, :integer, after: :description,   null:false
    add_column :products, :brand_id, :integer, after: :category_id
  end
end
