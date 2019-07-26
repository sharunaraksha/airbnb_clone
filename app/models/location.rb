class Location < ApplicationRecord
  belongs_to :listing
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :zip, presence: true
end
