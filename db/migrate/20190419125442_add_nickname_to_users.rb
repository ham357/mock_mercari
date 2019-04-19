class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :custmer_id, :string
    add_column :users, :card_token, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
