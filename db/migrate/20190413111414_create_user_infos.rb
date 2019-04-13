class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.string      :first_name,          null:false
      t.string      :last_name,           null:false
      t.string      :kana_first_name,     null:false
      t.string      :kana_last_name,      null:false
      t.integer     :postal_code,         null:false
      t.string      :state,               null:false
      t.string      :city,                null:false
      t.string      :adress,              null:false
      t.integer     :tel_number
      t.integer     :birth_year,          null:false
      t.integer     :birth_month,         null:false
      t.integer     :birth_day,           null:false
      t.text        :profile_comment
      t.string      :user_id,             null:false
      t.datetime    :created_at
      t.datetime    :update_at
    end
  end
end
