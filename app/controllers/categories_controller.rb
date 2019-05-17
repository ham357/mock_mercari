class CategoriesController < ApplicationController
  def index
    @main_categories = Category.eager_load(children: {children: :grand_children}).where(sub_category_id: nil)
  end

  def show
    @category = Category.find(params[:id])
    @all_products = Product.all

    if (params[:id]).to_i <= 13
      @select_categories = @all_products.select{ |o| o.category.sub_category_id == (params[:id].to_i)}
    elsif (params[:id]) < 14 && @category.sub_subcategory_id ==nil
      @select_categories = @all_products.select{ |o| o.category.pre_precategory == (params[:id].to_i)}
    else
      @select_categories = Product.where(category_id: params[:id])
    end

    @products = @select_categories
  end
end
