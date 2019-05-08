class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :rate, null: false
      t.integer :user_id ,null: false
      t.integer :rater_id ,null: false
      t.timestamps
    end
  end
end
