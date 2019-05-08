class ProductSize < ApplicationRecord
  validates :name, presence: true
<<<<<<< HEAD
=======
  belongs_to :product
  belongs_to :category
>>>>>>> ONAGAX/master
end
