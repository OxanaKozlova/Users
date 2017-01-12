class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, PictureUploader
  validates :title, :content, :image, presence: true

end
