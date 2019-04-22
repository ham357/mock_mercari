class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook  ,:google_oauth2]

  has_one :user_info
  has_one :social_profile
  accepts_nested_attributes_for :user_info
  accepts_nested_attributes_for :social_profile
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :product

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    socialprofile = SocialProfile.where(uid: uid, provider: provider).first
    if socialprofile.present?
      user = User.where(id: social_profile.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SocialProfile.create(
          uid: uid,
          provider: provider,
          user_id: user.id,
          access_token: "",
          access_secret: ""
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          telephone: "08000000000"
          )
          SocialProfile.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
