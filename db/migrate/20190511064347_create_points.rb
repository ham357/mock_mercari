class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :point, null: false
      t.integer :user_id, null: false
      t.datetime :deadline_at
      t.timestamps
    end
  end
end
