class CreateProductShippingFees < ActiveRecord::Migration[5.0]
  def change
    create_table :product_shipping_fees do |t|
      t.string       :name,                null:false, index: true
      t.timestamps
    end
  end
end
