class Product < ApplicationRecord
  validates_presence_of :name, :status, :shipping_fee, :state, :shipping_method, :shipping_day, :price, :description, :user_id
  validates :name, length: { maximum: 40 }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true}
  validates :description, length: { maximum: 100 }

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :product_sizes
  has_many :categories
  has_many :brands
  has_many :product_status

  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :status
end
