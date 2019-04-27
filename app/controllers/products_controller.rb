class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
        # @category = Category.all
        # @category = Category.where(["sub_category_id = ?", nil])
        @category = Category.where(sub_category_id: nil)
        # @categories = Category.find(1)
        # respond_to do |format|
        #     format.html
        #     format.json {
        #         @categories = Category.where(main_category_id:params[:id]) 
        #         render layout: "sell"
        #     }
        # end
        render layout: "sell"
    end

end
