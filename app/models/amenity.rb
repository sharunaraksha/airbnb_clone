class Amenity < ApplicationRecord
  belongs_to :listing, optional: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
end
