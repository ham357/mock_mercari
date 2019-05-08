class ProductsController < ApplicationController

    def index
        @products = Product.all
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
                format.html{render action: 'new'}
                format.json
            end
        end
    end

    def product_params
        params.require(:product).permit(:name,:status,:shipping_fee,:state,:shipping_method,:shipping_day,:price,:product_size_id,:description,:category_id,:brand_id, product_images_attributes: [:image_url]).merge(user_id:1)
    end

    def create_productimage(product_id)
        i = 0
        while params[:product][:product_images_attributes][:image_url][i.to_s].present? do
            image = params[:product][:product_images_attributes][:image_url][i.to_s]
            ProductImage.create(product_id: product_id, image_url: image)
            i += 1
        end
    end

end
