class Category < ApplicationRecord
  validates :name, presence: true
  has_one :product_size
end
