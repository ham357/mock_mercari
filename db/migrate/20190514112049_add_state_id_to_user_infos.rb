class AddStateIdToUserInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :state_id, :integer
  end
end
