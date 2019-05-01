class Category < ApplicationRecord
  validates :name, presence: true
  has_many :product_sizes
end
