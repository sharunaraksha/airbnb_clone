class Picture < ApplicationRecord
	 belongs_to :listing
	validates :description, presence: true
    #validates :image, file_size: { less_than: 1.megabytes }
 
  #mount_uploader :image, ImageUploader
  mount_uploaders :attachments, ImageUploader
end
