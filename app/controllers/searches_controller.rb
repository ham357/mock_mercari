class SearchesController < ApplicationController
  before_action :set_search

  def index
    @categories = Category.all
    @size = ProductSize.all
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")

    @products = @products.page(params[:page]).per(48)
    respond_to do |format|
      format.html
      format.json { render json: @brands}
    end
  end

  def set_search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

end
