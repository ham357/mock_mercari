require 'rails_helper'

describe SocialProfile do
  describe '#create' do

    before do
      @user = create(:user)
    end

    it "すべてのデータがあり正常に登録できる" do
      socialprofile = SocialProfile.new(uid: "1",
                                        provider: "facebook",
                                        access_token: "token",
                                        access_secret: "secret",
                                        user_id: @user.id)
      expect(socialprofile).to be_valid
    end

    it "uidなしでは保存不可" do
      socialprofile = SocialProfile.new(uid: nil)
      socialprofile.valid?
      expect(socialprofile.errors[:uid]).to include("can't be blank")
    end

    it "providerなしでは保存不可" do
      socialprofile = SocialProfile.new(provider: nil)
      socialprofile.valid?
      expect(socialprofile.errors[:provider]).to include("can't be blank")
    end

    it "user_idなしでは保存不可" do
      socialprofile = SocialProfile.new(user_id: nil)
      socialprofile.valid?
      expect(socialprofile).to be_invalid
    end

  end
end
