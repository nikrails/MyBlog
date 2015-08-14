class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :comments
  has_many :posts
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      #user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end