class Image < ApplicationRecord
  belongs_to :listing
  mount_uploader :image, ImageUploader
end
