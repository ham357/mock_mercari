module OrdersHelper

  def converting_to_jpy(price)
    price = "¥ " + price.to_s(:delimited)
  end

  def product_image(product)
    product.product_images.first.image_url.url
  end

end
