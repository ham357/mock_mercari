class ProductSize < ApplicationRecord
  validates :name, presence: true
  belongs_to :product
end
