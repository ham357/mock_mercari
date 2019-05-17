class UserImage < ApplicationRecord
  belongs_to :user, optional: true
end
