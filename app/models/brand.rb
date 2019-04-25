class Brand < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  belongs_to :product
end
