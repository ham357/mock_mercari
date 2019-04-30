class CategoryController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {
        # @categories = Category.where(main_category_id:params[:id],sub_category_id: nil) 
        category = Category.where(id:params[:id]) 
        if category[0].sub_category_id == nil
          # @categories = Category.where(main_category_id:category[0].main_category_id,sub_subcategory_id:category[0].sub_subcategory_id).where.not(sub_category_id: nil)
          @categories = Category.where(main_category_id:category[0].main_category_id,sub_subcategory_id:category[0].sub_subcategory_id)
          @product_sizes = ProductSize.where(size_category:@categories[0].size_category_id)
          # @categories = Category.where(main_category_id:category[0].main_category_id,sub_category_id:nil)
        else
          # @categories = Category.where("main_category_id = ? and sub_category_id ?" ,category[0].main_category_id,category[0].sub_category_id)
          # @categories = Category.where(main_category_id:category[0].main_category_id,sub_category_id: category[0].sub_category_id).where.not(sub_subcategory_id: nil)
          @categories = Category.where(main_category_id:category[0].main_category_id,sub_category_id: category[0].sub_category_id)
          # binding.pry
          @product_sizes = ProductSize.where(size_category:@categories[0].size_category_id)
        end

        render "products/new"
      }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {
          @categories = Category.where(main_category_id:params[:id]) 
          # binding.pry
          # render json: @categories
          # render layout: "sell"
      }
    end
  end
end
