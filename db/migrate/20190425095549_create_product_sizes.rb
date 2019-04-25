class CreateProductSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_sizes do |t|
      t.string       :name,                null:false, index: true
      t.integer      :size_category,       null:false
      t.timestamps
    end
  end
end
