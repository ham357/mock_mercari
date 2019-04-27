class SearchesController < ApplicationController
  before_action :set_search

  def index
    @categories = Category.all
    @products = @products.page(params[:page]).per(48)
    @category_name
  end

  def set_search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @products = @products.page(params[:page]).per(48)
  end

  def category_name(id)
    Category.find(id).name
  end
end
