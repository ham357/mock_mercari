class Point < ApplicationRecord
  belongs_to :user

  def self.all_point(user_id)
    points = Point.where(user_id: user_id)
    num = 0
    points.each do |p|
      num += p.point
    end
    return num
  end
end
