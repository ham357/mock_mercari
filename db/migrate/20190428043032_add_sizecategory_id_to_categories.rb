class AddSizecategoryIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :size_flg, :boolean,   null:false, default: 0, after: :sub_subcategory_id
    add_column :categories, :size_category_id, :integer, after: :size_flg
  end
end
