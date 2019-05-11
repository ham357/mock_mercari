class AddPaymentPriceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :payment_price, :integer,null: false
    add_column :orders, :point, :integer
  end
end
