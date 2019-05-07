FactoryBot.define do

  factory :product_image do
    image_url             {File.open("#{Rails.root}/public/images/no_image.jpg")}
    product_id            {}
  end

end
