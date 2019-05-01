require 'rails_helper'

describe ProductImage, type: :model do
  describe '#create' do

    before do
      @product = create(:product)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        product_image = build(:product_image, product_id: @product.id)
        expect(product_image).to be_valid
      end
    end
      
    context 'can not　save' do
      it "商品画像URLが無いためエラーになる" do
        product_image = build(:product_image, image_url: nil, product_id: @product.id)
        product_image.valid?
        expect(product_image.errors[:image_url]).to include("can't be blank")
      end
      
      it "商品IDが無いためエラーになる" do
        product_image = build(:product_image, product_id: nil)
        product_image.valid?
        expect(product_image.errors[:product_id]).to include("can't be blank")
      end
    end
 

  end
end
