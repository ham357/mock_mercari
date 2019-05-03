require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'GET #index' do
    it "インスタンス変数の値が正常" do
      products = create_list(:product, 3)
      get :index
      expect(assigns(:products)).to match(products)
    end

    it "ビューに正しく遷移できる" do
      get :index
      expect(response).to render_template :index
    end
  end
end
