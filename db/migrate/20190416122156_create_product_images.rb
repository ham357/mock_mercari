class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.text          :image_url,          null:false
      t.integer       :product_id,         null:false
      t.timestamps
    end
  end
end
