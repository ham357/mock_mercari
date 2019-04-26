class SearchesController < ApplicationController
  def index
    @products = search(params[:search])
  end


  def search(keyword)
    redirect_to root_path if params[:keyword] == ""
    splitKeyword = params[:keyword].split(/[[:blank:]]+/)

    @products = []
    splitKeyword.each do |keyword|
      next if keyword == ""
      @products = Product.where('name Like ? OR description Like ?', "%#{params[:keyword]}%")
    end
    @products.uniq!
  end

end
