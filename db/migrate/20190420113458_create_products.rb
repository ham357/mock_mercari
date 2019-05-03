class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string      :name,          null:false, index: true
      t.integer      :status,           null:false
      t.integer      :shipping_fee,     null:false
      t.integer      :state,      null:false
      t.integer     :shipping_method,      null:false
      t.integer     :shipping_day,      null:false
      t.integer      :price,      null:false
      t.text      :description,      null:false
      t.references     :user,           foreign_key: true, null:false
      t.boolean     :sold,           default: false
      t.timestamps
    end
  end
end
