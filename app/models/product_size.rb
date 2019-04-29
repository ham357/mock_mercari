class ProductSize < ApplicationRecord
  validates :name, presence: true
  belongs_to :product
  belongs_to :category
end
