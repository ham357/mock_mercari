class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.string      :first_name
      t.string      :last_name
      t.string      :kana_first_name
      t.string      :kana_last_name
      t.integer     :postal_code
      t.string      :state
      t.string      :city
      t.string      :address
      t.integer     :tel_number
      t.integer     :birth_year
      t.integer     :birth_month
      t.integer     :birth_day
      t.text        :profile_comment
      t.references     :user,           foreign_key: true, null:false

    end
  end
end
