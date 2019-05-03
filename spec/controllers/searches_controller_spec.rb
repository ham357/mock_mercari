require 'rails_helper'

describe SearchesController, type: :controller do
  before do
    FactoryBot.create(:other_user)
    FactoryBot.create(:other_product) do |s|
      s.product_images.create(FactoryBot.attributes_for(:product_image))
    end
    @params = Hash.new
    @params[:q] = Hash.new
  end

  describe 'get #index' do

    it "indexが描画できてる" do
      get :index
      expect(response).to render_template :index
    end

    it "キーワードで検索を実行後、検索機能している" do
      @params[:q][:name_or_description_cont] = "あ"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "キーワードで存在しないキーワードで実行後、検索が失敗している" do
      @params[:q][:name_or_description_cont] = "めるかり"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "カテゴリーで検索後、検索が成功している" do
      @params[:q][:category_id_eq] = "1"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しないカテゴリーで検索後、検索が失敗している" do
      @params[:q][:category_id_eq] = "2"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "ブランドidで検索後、検索が成功している" do
      @params[:q][:brand_id_eq] = "1"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しないブランドidで検索後、検索が失敗している" do
      @params[:q][:brand_id_eq] = "2"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "サイズで検索後、検索が成功している" do
      @params[:q][:product_size_id_eq] = "1"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しないサイズで検索後、検索が失敗している" do
      @params[:q][:product_size_id_eq] = "2"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "最低価格で検索後、検索が成功している" do
      @params[:q][:price_gteq] = "300"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しない最低価格で検索後、検索が失敗している" do
      @params[:q][:price_gteq] = "3001"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "最高価格で検索後、検索が成功している" do
      @params[:q][:price_lteq] = "3000"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しない最高価格で検索後、検索が失敗している" do
      @params[:q][:price_lteq] = "2999"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "商品の状態で検索後、検索が成功している" do
      @params[:q][:status_eq_any] = "1"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しない商品の状態で検索後、検索が失敗している" do
      @params[:q][:status_eq_any] = "2"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "配送料の負担で検索後、検索が成功している" do
      @params[:q][:shipping_fee_eq_any] = "1"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しない配送料の負担で検索後、検索が失敗している" do
      @params[:q][:shipping_fee_eq_any] = "2"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
    it "販売状況で検索後、検索が成功している" do
      @params[:q][:sold_eq_any] = "false"
      get :index, params: @params
      expect(assigns(:products)).to be_truthy
      expect(response).to render_template :index
    end
    it "存在しない販売状況で検索後、検索が失敗している" do
      @params[:q][:sold_eq_any] = "true"
      get :index, params: @params
      expect(assigns(:products)).to be_empty
      expect(response).to render_template :index
    end
  end
end
