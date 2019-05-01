require 'rails_helper'

describe Like, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
      @product = create(:product)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        like = build(:like, user_id: @user.id, product_id: @product.id)
        expect(like).to be_valid
      end
    end
      
    context 'can not　save' do
      it "ユーザーIDがないためエラーになる" do
        like = build(:like, user_id: nil, product_id: @product.id)
        like.valid?
        expect(like.errors[:user]).to include("must exist")
      end
      
      it "商品IDが無いためエラーになる" do
        like = build(:like, user_id: @user.id, product_id: nil)
        like.valid?
        expect(like.errors[:product]).to include("must exist")
      end

      it "商品ID一つに対してユーザーIDが重複しているためエラーになる" do
        user_like_product      = create(:like, user_id: @user.id, product_id: @product.id)
        user_like_same_product = build(:like, user_id: @user.id, product_id: @product.id)
        user_like_same_product.valid?
        expect(user_like_same_product.errors[:user_id]).to include("has already been taken")
      end
    end
 

  end
end
