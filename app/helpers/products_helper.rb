module ProductsHelper

  def converting_to_jpy(price)
    price = "¥ " + price.to_s(:delimited)
  end

end
