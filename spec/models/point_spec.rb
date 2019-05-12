require 'rails_helper'

describe Point, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        point = build(:point,user_id: @user.id)
        expect(point).to be_valid
      end
    end

    context 'can not　save' do
      it "ユーザーIDがないためエラーになる" do
        point = build(:card)
        point.valid?
        expect(point.errors[:user]).to include("must exist")
      end
    end

  end
end
