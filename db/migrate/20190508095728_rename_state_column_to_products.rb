class RenameStateColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :status, :status_id
    rename_column :products, :shipping_method, :shipping_method_id
  end
end
