require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) { create(:user)}
  let(:update_attributes) do
    {
        price: 99999
    }
  end
  before do
    sign_in user
  end
  
  describe 'GET #index' do
    it "インスタンス変数の値が正常" do
      products = create_lis(:product, 3,user_id: user.id)
      get :index
      expect(assigns(:products)).to match(products)
    end

    it "ビューに正しく遷移できる" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe '#show' do
    context 'viewが見えてるか' do
      it 'showのテンプレートが表示されてるか' do
        product = create(:product, user_id: user.id, name: 'あああ')
        product_image = create(:product_image, product_id: product.id)
        category = create(:category)
        brand = create(:brand)
        get :show, params: {id: product.id}
        expect(response).to render_template :show
      end
      it 'タイトルが出てるか' do
        product = create(:product, user_id: user.id, name: 'あああ')
        product_image = create(:product_image, product_id: product.id)
        category = create(:category)
        brand = create(:brand)
        get :show, params: {id: product.id}
        expect(assigns(:product).name).to eq "あああ"
      end
    end
  end

  describe '#destroy' do
    it "商品が削除されているか" do
      product = create(:product,user_id:user.id)
      4.times{ create(:product_image, product_id: product.id) }
      expect{
        delete :destroy, id: product
      }.to change(Product,:count).by(-1)
    end
  end

  describe '#update' do
    it "正常に変数にテストデータが入っているか" do
      product = create(:product,user_id:user.id)
      4.times{ create(:product_image, product_id: product.id) }
      patch :update, params: { id: product.id, product: attributes_for(:product) }
      expect(assigns(:product)).to eq product
    end

    it "価格が更新できているか" do
      product = create(:product,user_id:user.id)
      4.times{ create(:product_image, product_id: product.id) }
      patch :update, params: { id: product.id, product: update_attributes }
      product.reload
      expect(product.price).to eq(99999)
    end

    it "正常にトップページへリダイレクトされているか" do
      product = create(:product,user_id:user.id)
      4.times{ create(:product_image, product_id: product.id) }
      patch :update, params: { id: product.id, product: update_attributes }
      expect(response).to redirect_to root_path
    end
  end
end
