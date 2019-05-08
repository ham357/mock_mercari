class RemoveSizeFlgFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :size_flg, :boolean
    remove_column :categories, :size_category_id, :integer
    remove_column :categories, :brand_flg, :boolean
  end
end
