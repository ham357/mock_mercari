class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment ,null: false
      t.integer :user_id ,null: false
      t.integer :product_id ,null: false
      t.boolean :comment_deleted ,default: false
      t.timestamps
    end
  end
end
