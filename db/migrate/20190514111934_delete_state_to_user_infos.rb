class DeleteStateToUserInfos < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_infos, :state, :string
  end
end
