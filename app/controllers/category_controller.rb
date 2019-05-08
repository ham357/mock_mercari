class CategoryController < ApplicationController
  def index
    category = Category.where(id:params[:id]) 

    if category[0].sub_category_id == nil
      @categories = Category.where(main_category_id:category[0].main_category_id,sub_subcategory_id:category[0].sub_subcategory_id)
    else
      @categories = Category.where(main_category_id:category[0].main_category_id,sub_category_id:category[0].sub_category_id)
    end

    @product_sizes = ProductSize.where(product_size_id:@categories[0].product_size_id)
    render "products/new"

    respond_to do |format|
      format.html
      format.json { @categories 
                    @product_sizes }
    end
  end

end
