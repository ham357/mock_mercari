class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.text        :image_url
      t.references     :user,           foreign_key: true, null:false
      t.timestamps
    end
  end
end
