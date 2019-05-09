class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :comment, :user_id, presence: true
end
