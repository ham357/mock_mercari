class SearchesController < ApplicationController
  before_action :set_search

  def index
    @categories = Category.all
    @size = ProductSize.all
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")

    @products = @products.page(params[:page]).per(48)
    @products = if(params[:sort]) =="1" then @products.price_asc
                  elsif(params[:sort]) =="2" then @products.prie_desc
                  elsif(params[:sort]) =="3" then @products.created_at
                  elsif(params[:sort]) =="4" then @products.created_at
                  elsif(params[:sort]) =="5" then @products.like_desc
                end unless (params[:q]) == 0

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

end
