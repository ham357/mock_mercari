class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string       :email,                    null: false
      t.string       :encrypted_password,       null: false
      t.datetime     :created_at
      t.datetime     :updated_at
      t.string       :nickname,                  null: false, unique: true, index: true
      t.timestamps   null: true
    end
  end
end
