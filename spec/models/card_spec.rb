require 'rails_helper'

describe Card, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        card = build(:card,user_id: @user.id)
        expect(card).to be_valid
      end
    end

    context 'can not　save' do
      it "ユーザーIDがないためエラーになる" do
        card = build(:card)
        card.valid?
        expect(card.errors[:user]).to include("must exist")
      end
    end

  end
end
