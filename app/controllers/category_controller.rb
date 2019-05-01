class CategoryController < ApplicationController
  def index
    category = Category.where(id:params[:id]) 

    if category[0].sub_category_id == nil
      @categories = Category.where(main_category_id:category[0].main_category_id,sub_subcategory_id:category[0].sub_subcategory_id)
    else
      @categories = Category.where(main_category_id:category[0].main_category_id,sub_category_id:category[0].sub_category_id)
    end

    @product_sizes = ProductSize.where(size_category:@categories[0].size_category_id)
    render "products/new"

    respond_to do |format|
      format.html
      format.json { @categories 
                    @product_sizes }
    end
  end

end
