class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
        # @category = Category.where(["sub_category_id = ? and sub_subcategory_id = ?", "Null", "Null"])
        @category = Category.where(sub_category_id: nil)
        render layout: "sell"
    end

end
