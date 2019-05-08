class RenameSizeCategoryIdColumnToProductSizes < ActiveRecord::Migration[5.0]
  def change
    rename_column :product_sizes, :size_category_id, :product_size_id
  end
end
