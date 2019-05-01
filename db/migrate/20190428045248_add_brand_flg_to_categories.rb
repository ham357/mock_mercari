class AddBrandFlgToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :brand_flg, :boolean,   null:false, default: 0, after: :size_category_id
  end
end
