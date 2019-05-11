class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.string :purchase_amount, null: false
      t.boolean :convert_cash, default: false
      t.timestamps
    end
  end
end
