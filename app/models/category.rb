class Category < ApplicationRecord
  validates :name, presence: true
  has_one :product_size

  belongs_to :parent, class_name: :Category
  belongs_to :grand_children, class_name: :Category
  has_many :children,class_name: :Category, foreign_key: :pre_category_id
  has_many :grand_children,class_name: :Category, foreign_key: :pre_precategory_id

  scope :sub_category_search, -> (main_category_id){ where(main_category_id: main_category_id,sub_subcategory_id: nil).where.not(sub_category_id: nil)}
end
