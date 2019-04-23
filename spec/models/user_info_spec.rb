require 'rails_helper'

describe UserInfo do
  describe '#create' do

    it " すべてのデータがあり正常に登録できる" do
      userinfo = build(:user)
      expect(userinfo).to be_valid
    end

    it "first_nameなしでは保存不可" do
      userinfo = build(:user_info, first_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:first_name]).to include("can't be blank")
    end

    it "first_nameが36文字以上だと保存不可 " do
      userinfo = build(:user_info, first_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:first_name][0]).to include("is too long")
    end

    it "first_nameが35文字以下だと保存可能" do
      userinfo = build(:user_info, first_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "last_nameが空だと保存不可" do
      userinfo = build(:user_info, last_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:last_name]).to include("can't be blank")
    end

    it "last_nameが36文字以上だと保存不可" do
      userinfo = build(:user_info, last_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:last_name][0]).to include("is too long")
    end

    it "last_nameが35文字以下だと保存可能" do
      userinfo = build(:user_info, last_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "kana_first_nameが空だと保存不可" do
      userinfo = build(:user_info, kana_first_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:kana_first_name]).to include("can't be blank")
    end

    it "kana_first_nameが36文字以上だと保存不可" do
      userinfo = build(:user_info, kana_first_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:kana_first_name][0]).to include("is too long")
    end

    it "ana_first_nameが35文字以下だと保存可能" do
      userinfo = build(:user_info, kana_first_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "kana_last_nameが空だと保存不可" do
      userinfo = build(:user_info, kana_last_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:kana_last_name]).to include("can't be blank")
    end

    it "kana_last_nameが36文字以上だと保存不可" do
      userinfo = build(:user_info, kana_last_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:kana_last_name][0]).to include("is too long")
    end

    it "kana_last_nameが35文字以下だと保存可能" do
      userinfo = build(:user_info, kana_last_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "birth_yearが空だと保存不可" do
      userinfo = build(:user_info, birth_year: nil)
      userinfo.valid?
      expect(userinfo.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthが空だと保存不可" do
      userinfo = build(:user_info, birth_month: nil)
      userinfo.valid?
      expect(userinfo.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayが空だと保存不可" do
      userinfo = build(:user_info, birth_day: nil)
      userinfo.valid?
      expect(userinfo.errors[:birth_day]).to include("can't be blank")
    end

  end
end
