class Category < ApplicationRecord
  # belongs_to :product
  validates :name, presence: true
  # validates_uniqueness_of :sub_category_id, :sub_subcategory_id, scope: :main_category_id
end
