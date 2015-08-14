class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :comments
  belongs_to :user
  scope :all_publish,-> {where(publish: true)}
end
