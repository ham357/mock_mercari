require 'rails_helper'
describe OrdersController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user)}
    let(:product) { create(:product, user_id: user.id)}
    before do
      sign_in user
    end
    it "indexのテンプレートが表示されるか" do
      get :index,params:{product_id: product.id}
      expect(response).to render_template :index
    end
  end
  describe '#show' do
    let(:user) { create(:user)}
    let(:product) { create(:product, user_id: user.id)}
    before do
      sign_in user
    end
    it 'showのテンプレートが表示されてるか' do
      order = create(:order,product_id: product.id,user_id: product.user.id)
      get :show, params:{product_id: product.id,id: order.id}
      expect(response).to render_template :show
    end
  end
  describe '#create' do
    let!(:user) { create(:user)}
    let!(:product) { create(:product, user_id: user.id)}
    let!(:card) { create(:card, user_id: user.id)}
    let!(:point) { create(:point, user_id: user.id)}
    before do
      sign_in user
    end
    it '購入商品はちゃんと登録されるか' do
      expect{
        post :create, params:{product_id: product.id,order:{
          payment_price: '1000',
          point: ''
        }}
      }.to change(Order,:count).by(+1)
    end

    it '購入商品はポイント込みでちゃんと登録されるか' do
      expect{
        post :create, params:{product_id: product.id,order:{
          payment_price: '700',
          point: '300'
        }}
      }.to change(Order,:count).by(+1)
    end
  end
end
