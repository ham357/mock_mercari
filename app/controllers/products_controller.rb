class ProductsController < ApplicationController
  before_action :now_product, only: %i[show search_rate category_define]

    def index
        @products = Product.all.limit(48)
    end

    def new
        @product = Product.new
        @product.product_images.build
        @main_categories = Category.where(sub_category_id: nil)
        render layout: "sell"
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            create_productimage(@product.id)
            respond_to do |format|
                format.html { redirect_to root_path }
                format.json
            end
        else
            @product.product_images.build
            respond_to do |format|
                format.html{render new_product_path}
                format.json
            end
        end
    end

  def show
      @get_image = get_image
      @search_rate3 = search_rate(3)
      @search_rate2 = search_rate(2)
      @search_rate1 = search_rate(1)
      @category_defines = defined_category
      @likes = Like.where(product_id: @product.id)
      @comments = Comment.where(product_id: params[:id])
      @comment = Comment.new
      @exclusion_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).limit(6)
      @exclusion_product_brands = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).limit(6)
    end

    def destroy
        @product =  Product.find(params[:id])
        @product.destroy
        redirect_to root_path, notice: "削除しました"
    end

    def edit
        @product = Product.find(params[:id])
        @product_images = ProductImage.where(product_id: @product.id)
        @category_id = @product.category_id
        @main_categories = Category.where(sub_category_id: nil)
        @sub_categories = Category.sub_category_search(@product.category.main_category_id)
        @sub_subcategories = Category.where(main_category_id: @product.category.main_category_id,sub_category_id: @product.category.sub_category_id).where.not(sub_subcategory_id: nil)
        render layout: "sell"
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            update_productimage(@product)
            respond_to do |format|
                format.html { redirect_to root_path , notice: "更新しました"}
                format.json
            end
        else
            @category_id = @product.category_id
            @main_categories = Category.where(sub_category_id: nil)
            @sub_categories = Category.sub_category_search(@product.category.main_category_id)
            @sub_subcategories = Category.where(main_category_id: @product.category.main_category_id,sub_category_id: @product.category.sub_category_id).where.not(sub_subcategory_id: nil)    
            respond_to do |format|
                format.html{render edit_product_path}
                format.json
            end
        end
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
    def defined_category
      @category_id = @product.category_id
      @main_id = @product.category.main_category_id
      @sub_id = @product.category.sub_category_id
      @subsub_id = @product.category.sub_subcategory_id
      if @sub_id && @subsub_id == nil
        main_name = Category.find(@main_id).name
        sub_name,subsub_name = 0
      elsif @sub == presence && @subsub == nil
        main_name = Category.find(@main_id).name
        sub_name = Category.find(@sub_id).name
      else
        main_name = Category.find(@main_id).name
        sub_name = Category.find(@sub_id).name
        subsub_name = Category.find(@category_id).name
      end
      return main_name, sub_name, subsub_name
    end

    private

    def now_product
      @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name,:status_id,:shipping_fee_id,:state_id,:shipping_method_id,:shipping_day_id,:price,:product_size_id,:description,:category_id,:brand_id, product_images_attributes: [:image_url]).merge(user_id: current_user.id)
    end

    def create_productimage(product_id)
        i = 0
        while params[:product][:product_images_attributes][:image_url][i.to_s].present? do
            image = params[:product][:product_images_attributes][:image_url][i.to_s]
            ProductImage.create(product_id: product_id, image_url: image)
            i += 1
        end
    end

    
    def update_productimage(product)
        if params[:DeletedImageUrls].present?
            product_image = product.product_images.find_by(image_url: params[:DeletedImageUrls])
            product_image.destroy
        end
        if params[:product][:product_images_attributes].present?
            i = 0
            while params[:product][:product_images_attributes][:image_url][i.to_s].present? do
                image = params[:product][:product_images_attributes][:image_url][i.to_s]
                ProductImage.create(product_id: product.id, image_url: image)
                i += 1
            end
        end
    end

end
