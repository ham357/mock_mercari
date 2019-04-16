class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.string      :first_name,          null:false
      t.string      :last_name,           null:false
      t.string      :kana_first_name,     null:false
      t.string      :kana_last_name,      null:false
      t.integer     :postal_code,         
      t.string      :state,               
      t.string      :city,                
      t.string      :address,              
      t.integer     :tel_number
      t.integer     :birth_year,          null:false
      t.integer     :birth_month,         null:false
      t.integer     :birth_day,           null:false
      t.text        :profile_comment
      t.string      :user_id,             null:false
      t.timestamps null: false
    end
  end
end
