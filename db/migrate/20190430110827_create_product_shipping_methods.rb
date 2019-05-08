class CreateProductShippingMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :product_shipping_methods do |t|
      t.string       :name,  null:false, index: true
      t.integer      :shipping_fee_category, null:false
      t.timestamps
    end
  end
end
