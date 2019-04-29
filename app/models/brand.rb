class Brand < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  belongs_to :product
  belongs_to :category
end
