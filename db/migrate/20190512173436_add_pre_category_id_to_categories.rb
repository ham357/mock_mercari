class AddPreCategoryIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :pre_category_id, :integer
    add_column :categories, :pre_precategory_id, :integer
  end
end
