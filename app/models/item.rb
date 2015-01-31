class Item < ActiveRecord::Base

  validates :title, presence: true
  mount_uploader :content, ContentUploader

end