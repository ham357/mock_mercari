require 'rails_helper'

describe Product, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        product = build(:product, user_id: @user.id)
        expect(product).to be_valid
      end
      
      it "商品名が39文字で登録できる" do
        product = build(:product, name:  "#{'a' * 39}",user_id: @user.id)
        expect(product).to be_valid
      end
      
      it "説明文が100文字より少ない" do
        product = build(:product, description:  "#{'a' * 99}",user_id: @user.id)
        expect(product).to be_valid
      end
    end
    
    context 'can not save' do
      it "商品名が無いためエラーになる" do
        product = build(:product, name: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "商品の状態が無いためエラーになる" do
        product = build(:product, status: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:status]).to include("can't be blank")
      end

      it "商品名が無いためエラーになる" do
        product = build(:product, shipping_fee: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:shipping_fee]).to include("can't be blank")
      end

      it "発送元が登録されていないためエラーになる" do
        product = build(:product, state: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:state]).to include("can't be blank")
      end

      it "発送方法が登録されていないためエラーになる" do
        product = build(:product, shipping_method: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:shipping_method]).to include("can't be blank")
      end

      it "発送日数が登録されていないためエラーになる" do
        product = build(:product, shipping_day: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:shipping_day]).to include("can't be blank")
      end

      it "価格が登録されていないためエラーになる" do
        product = build(:product, price: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "説明文が登録されていないためエラーになる" do
        product = build(:product, description: nil,user_id: @user.id)
        product.valid?
        expect(product.errors[:description]).to include("can't be blank")
      end
      
      it "商品が登録されていないためエラーになる" do
        product = build(:product, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",user_id: @user.id)
        product.valid?
        expect(product.errors[:name][0]).to include("is too long")
      end
      
      
      it "価格が300円未満のためエラーになる" do
        product = build(:product, price: 299,user_id: @user.id)
        product.valid?
        expect(product.errors[:price][0]).to include("must be greater than or equal to 300")
      end
      
      it "価格が9999999円以上のためエラーになる" do
        product = build(:product, price: 10000000,user_id: @user.id)
        product.valid?
        expect(product.errors[:price][0]).to include("must be less than or equal to 9999999")
      end
      
      it "価格が数字以外のためエラーになる" do
        product = build(:product, price: "a",user_id: @user.id)
        product.valid?
        expect(product.errors[:price][0]).to include("is not a number")
      end
      
      it "説明文が100文字より多いためエラーになる" do
        product = build(:product, description:  "#{'a' * 101}",user_id: @user.id)
        product.valid?
        expect(product.errors[:description][0]).to include("is too long")
      end
    end

  end
end
