require 'rails_helper'

describe Order, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
      @product = create(:product,user_id: @user.id)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        order = build(:order,user_id: @user.id,point:'100',product_id: @product.id)
        expect(order).to be_valid
      end
    end

    context 'can not　save' do
      it "ユーザーIDがないためエラーになる" do
        order = build(:order,product_id: @product.id)
        order.valid?
        expect(order.errors[:user]).to include("must exist")
      end

      it "プロダクトIDがないためエラーになる" do
        order = build(:order, user_id: @user.id)
        order.valid?
        expect(order.errors[:product]).to include("must exist")
      end

      it "Payment_priceがないためエラーになる" do
        order = build(:order, payment_price: nil,user_id: @user.id,point:'100',product_id: @product.id)
        order.valid?
        expect(order.errors[:payment_price]).to include("can't be blank")
      end

    end

  end
end
