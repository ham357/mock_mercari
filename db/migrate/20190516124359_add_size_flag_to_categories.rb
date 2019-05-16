class AddSizeFlagToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :size_flag, :boolean
    add_column :categories, :brand_flag, :boolean
  end
end
