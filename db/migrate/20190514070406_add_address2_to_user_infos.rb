class AddAddress2ToUserInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :address2, :string
  end
end
