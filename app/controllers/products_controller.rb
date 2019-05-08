class ProductsController < ApplicationController
  before_action :now_product, only: %i[show search_rate category_define]

  def index
      @products = Product.all
  end

  def new
      @product = Product.new
      @category = Category.where(sub_category_id: nil)
      render layout: "sell"
  end

  def show
      @get_image = get_image
      @search_rate3 = search_rate(3)
      @search_rate2 = search_rate(2)
      @search_rate1 = search_rate(1)
      @category_defines = category_define
      @brand = Brand.find(@product.brand_id).name
      @status = Status.find(@product.status_id).name unless @product.status_id.nil?
      @shipping_fee = ShippingFee.find(@product.shipping_fee).name
      @prefecture = Prefecture.find(@product.state).name
      @shipping_day = ShippingDay.find(@product.shipping_day).name
      @likes = Like.where(product_id: @product.id)
      @comments = Comment.where(product_id: params[:id])
      @comment = Comment.new
      @exclusion_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).limit(6)
      @exclusion_product_brands = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).limit(6)
    end

    #product_imageの4個分配列作成
    def get_image
      @images = []
      for n in 0..3 do
        @images <<  @product.product_images[n][:image_url]
      end
    end

    # ユーザーの評価の配列を取り出す関数
    def search_rate(rate)
      @rate_id = @product.user.id
      @return = Rate.where(user_id: @rate_id, rate: rate)
    end

    # カテゴリーごとの名称取得関数（配列で出力）
    def category_define
      @category_id = @product.category_id
      @main_id = @product.category.main_category_id
      @sub_id = @product.category.sub_category_id
      @subsub_id = @product.category.sub_subcategory_id
      if @sub_id && @subsub_id == nil
        main = Category.find(@main_id).name
        sub,subsub = 0
      elsif @sub == presence && @subsub == nil
        main = Category.find(@main_id).name
        sub = Category.find(@sub_id).name
      else
        main = Category.find(@main_id).name
        sub = Category.find(@sub_id).name
        subsub = Category.find(@category_id).name
      end
      return main, sub, subsub
    end

    private

    def now_product
      @product = Product.find(params[:id])
    end

end
