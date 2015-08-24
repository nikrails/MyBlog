class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify
  mount_uploader :image, ImageUploader
  has_many :comments
  has_many :posts
  has_and_belongs_to_many :roles,:join_table => :users_roles
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



# me = FbGraph::User.me(ACCESS_TOKEN)
# me.feed!(
#   :message => 'Updating via FbGraph',:picture => 'https://graph.facebook.com/matake/picture',
#   :link => 'https://github.com/nov/fb_graph',:name => 'FbGraph',:description => 'A Ruby wrapper for Facebook Graph API'
# )