require 'rails_helper'

describe UserInfo do
  describe '#create' do

    it "is invalid all date" do
      userinfo = build(:user)
      expect(userinfo).to be_valid
    end

    it "is invalid without a first_name" do
      userinfo = build(:user_info, first_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid with a first_name that has more than 36 characters " do
      userinfo = build(:user_info, first_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:first_name][0]).to include("is too long")
    end

    it "is valid with a first_name that has less than 35 characters " do
      userinfo = build(:user_info, first_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "is invalid without a last_name" do
      userinfo = build(:user_info, last_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid with a last_name that has more than 36 characters " do
      userinfo = build(:user_info, last_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:last_name][0]).to include("is too long")
    end

    it "is valid with a last_name that has less than 35 characters " do
      userinfo = build(:user_info, last_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "is invalid without a kana_first_name" do
      userinfo = build(:user_info, kana_first_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:kana_first_name]).to include("can't be blank")
    end

    it "is invalid with a kana_first_name that has more than 36 characters " do
      userinfo = build(:user_info, kana_first_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:kana_first_name][0]).to include("is too long")
    end

    it "is valid with a kana_first_name that has less than 35 characters " do
      userinfo = build(:user_info, kana_first_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "is invalid without a kana_last_name" do
      userinfo = build(:user_info, kana_last_name: nil)
      userinfo.valid?
      expect(userinfo.errors[:kana_last_name]).to include("can't be blank")
    end

    it "is invalid with a kana_last_name that has more than 36 characters " do
      userinfo = build(:user_info, kana_last_name: "a"*36)
      userinfo.valid?
      expect(userinfo.errors[:kana_last_name][0]).to include("is too long")
    end

    it "is valid with a kana_last_name that has less than 35 characters " do
      userinfo = build(:user_info, kana_last_name: "a"*35)
      expect(userinfo).to be_valid
    end

    it "is invalid without a birth_year" do
      userinfo = build(:user_info, birth_year: nil)
      userinfo.valid?
      expect(userinfo.errors[:birth_year]).to include("can't be blank")
    end

    it "is invalid without a birth_month" do
      userinfo = build(:user_info, birth_month: nil)
      userinfo.valid?
      expect(userinfo.errors[:birth_month]).to include("can't be blank")
    end

    it "is invalid without a birth_day" do
      userinfo = build(:user_info, birth_day: nil)
      userinfo.valid?
      expect(userinfo.errors[:birth_day]).to include("can't be blank")
    end

  end
end
