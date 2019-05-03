class ProductShippingMethodsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {
        @product_shipping_methods = ProductShippingMethod.where(shipping_fee_category:params[:id]) 
        render "products/new"
      }
    end
  end

end
