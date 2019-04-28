class SearchesController < ApplicationController
  before_action :set_search

  def index
    @categories = Category.all
    @products = @products.page(params[:page]).per(48)

    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json { render json: @brands}
    end
  end

  def set_search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @products = @products.page(params[:page]).per(48)
  end

  #indexが複雑になるため、この関数から飛ばしたいが上手く飛ばせない
  def search
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json { render 'index', json: @brands}
    end
  end
end
