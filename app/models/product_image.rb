class ProductImage < ApplicationRecord
  validates_presence_of :image_url, :product_id

  belongs_to :product, optional: true
  
  mount_uploader :image_url, ImageUploader
end
