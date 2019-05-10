class RenameStateColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :shipping_method, :shipping_method_id
    rename_column :products, :state, :state_id
    rename_column :products, :shipping_day, :shipping_day_id
    rename_column :products, :shipping_fee, :shipping_fee_id
  end
end
