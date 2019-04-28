class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
          t.string       :name,                null:false, index: true
          t.integer      :main_category_id,    null:false
          t.integer      :sub_category_id
          t.integer      :sub_subcategory_id
          t.integer      :product_size_id
          t.boolean      :size_flag,   default: false, null: false
          t.boolean      :brand_flag,   default: false, null: false
          t.timestamps
    end
  end
end
