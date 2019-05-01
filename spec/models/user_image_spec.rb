require 'rails_helper'

describe UserImage, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
    end

    it "すべてのデータがあり、正常に登録できる" do
      userimage = build(:user_image, user_id: @user.id)
      expect(userimage).to be_valid
    end

    it "user_idなしでは保存不可" do
      userimage = UserImage.new(user_id: nil)
      userimage.valid?
      expect(userimage).to be_invalid
    end

  end
end
