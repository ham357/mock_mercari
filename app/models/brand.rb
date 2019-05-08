class Brand < ApplicationRecord
  validates :name, presence: true
<<<<<<< HEAD
=======
  validates :name, uniqueness: true
  belongs_to :product
  belongs_to :category
>>>>>>> ONAGAX/master
end
