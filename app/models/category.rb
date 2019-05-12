class Category < ApplicationRecord
  validates :name, presence: true
  has_one :product_size

  belongs_to :parent, class_name: :Category
  has_many :children,class_name: :Category, foreign_key: :main_category_id

  def self.get_array_subsub(main,sub)
    array = Category.where(main_category_id: main).where(sub_category_id: sub)
  end
end
