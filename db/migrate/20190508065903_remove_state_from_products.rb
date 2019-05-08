class RemoveStateFromProducts < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :state
    remove_column :products, :shipping_day
    remove_column :products, :shipping_fee
  end

  def down
    add_columun :products, :state, :integer
    add_columun :products, :shipping_day, :integer
    add_columun :products, :shipping_fee, :integer
  end
end