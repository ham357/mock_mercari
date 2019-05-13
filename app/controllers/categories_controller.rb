class CategoriesController < ApplicationController
  def index
    @main_categories = Category.eager_load(children: :children).where(sub_category_id: nil)
  end

  def show
    @category = Category.find(params[:id])
    products = Product.where(category_id: params[:id])
    @products = products.page(params[:page]).per(48)
    # カテゴリー詳細ページ
  end
end
