class ItemsController < ApplicationController
    def show
    @product = Product.find(params[:id])
    @images = get_image
    @rate_id = @product.user.id
    @good = search_rate(3)
    @soso = search_rate(2)
    @bad = search_rate(1)
    @cate_name = category_define
    @brand = Brand.find(@product.id).name
    @status = Status.find(@product.id).name
    @shipping_fee = ShippingFee.find(@product.id).name
    @state = Prefecture.find(@product.id).name
    @shipping_day = ShippingDay.find(@product.id).name
    @like = Like.where(product_id: @product.id)
    @products = Product.where(id: 1..6)
    # binding.pry
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
    @product = Product.find(params[:id])
    @rate_id = @product.user.id
    @return = Rate.where(user_id: @rate_id, rate: rate)
  end

  # カテゴリーごとの名称取得関数（配列で出力）
  def category_define
    @product = Product.find(params[:id])
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
end
