require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) { create(:user)}
  describe 'GET #index' do
    it "インスタンス変数の値が正常" do
      products = create_list(:product, 3,user_id: user.id)
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
end
