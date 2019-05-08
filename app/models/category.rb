class Category < ApplicationRecord

  belongs_to :product
  validates :name, presence: true
  has_one :brand
  has_one :product_size
end
