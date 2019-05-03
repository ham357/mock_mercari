class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
        @product.product_images.build
        # @categories = Category.where(sub_category_id: nil)
        render layout: "sell"
    end

    def create
        @product = Product.new(product_params)
        # @product.save
        respond_to do |format|
            if @product.save
                binding.pry
                params[:product_images][:image_url].each do |image|
                    @product.product_images.create(image_url: image, product_id: @product.id)
                end
                format.html{redirect_to root_path}
            else
                binding.pry
                @product.product_images.build
                # @categories = Category.where(sub_category_id: nil)
                format.html{render action: 'new'}
            end
        end
    end

    def product_params
        params.require(:product).permit(:name,:status,:shipping_fee,:state,:shipping_method,:shipping_day,:price,:size,:description,:category_id,:brand_id, product_images_attributes: [:image_url]).merge(user_id:1)
    end

end
