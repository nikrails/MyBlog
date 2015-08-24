class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged
  translates :title, :description,:locale,:fallbacks_for_empty_translations => true
  mount_uploader :image, ImageUploader
  has_many :comments
  belongs_to :user
  scope :all_publish,-> {where(publish: true)}
end
