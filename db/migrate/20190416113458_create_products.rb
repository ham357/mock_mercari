class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string      :name,          null:false, index: true
      t.string      :status,           null:false
      t.integer      :shipping_fee,     null:false
      t.string      :state,      null:false
      t.integer     :shipping_day,      null:false        
      t.integer      :price,      null:false
      t.string      :size
      t.text      :description,      null:false    
      t.integer     :user_id
      t.boolean     :sold,           default: false
      t.timestamps
    end
  end
end
