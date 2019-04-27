class SearchesController < ApplicationController
  before_action :set_search

  def index
    @products = @products.page(params[:page]).per(48)
  end

  def set_search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @products = @products.page(params[:page]).per(48)
  end

end
