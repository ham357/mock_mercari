class CreateSocialProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :social_profiles do |t|
      t.string     :provider,      null:false
      t.string     :uid,      null:false
      t.string     :access_token
      t.string     :access_secret
      t.integer    :user_id,             null:false
      t.timestamps
    end
  end
end
