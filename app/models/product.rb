class Product < ApplicationRecord
  validates_presence_of :name, :status, :shipping_fee, :state, :shipping_day, :price, :description, :sold
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 100 }

  has_many :product_images, :dependent: :destroy
end
