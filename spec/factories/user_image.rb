FactoryBot.define do

  factory :user_image do
    image_url {File.open("#{Rails.root}/public/images/no_image.jpg")}
    user
  end

end
