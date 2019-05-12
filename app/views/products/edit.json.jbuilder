json.product_images do
  if @product_images.present?
    json.array! @product_images do |product_image|
      json.id                   product_image.id
      json.image_url                 product_image.image_url
      json.product_id     product_image.product_id
    end
  end
end
