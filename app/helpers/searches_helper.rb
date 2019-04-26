module SearchesHelper

  def search(keyword)
    splitKeyword = params[:keyword].split(/[[:blank:]]+/)
    @products = []
    splitKeyword.each do |keyword|
      next if keyword == ""
      @products = Product.where('name Like(?)', "%#{params[:keyword]}%")
    end
    @products.uniq!
  end

end
