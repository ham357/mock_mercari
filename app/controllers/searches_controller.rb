class SearchesController < ApplicationController
  include SearchesHelper

  def index
    @products = search(params[:search])
    @products = @products.page(params[:page]).per(48)
  end


end
