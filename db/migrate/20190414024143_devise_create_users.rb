# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string       :email,              null: false
      t.string       :encrypted_password, null: false
      t.datetime     :created_at
      t.datetime     :updated_at
      t.string       :nickname,           null: false, unique: true, index: true
      t.timestamps null: true
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
