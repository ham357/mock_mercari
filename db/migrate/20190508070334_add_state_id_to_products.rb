class AddStateIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :state_id, :integer
    add_column :products, :shipping_day_id, :integer
    add_column :products, :shipping_fee_id, :integer
  end
end
