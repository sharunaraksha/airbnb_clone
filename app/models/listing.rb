class Listing < ApplicationRecord
  belongs_to :user
  has_many :amenities, :dependent => :destroy
  has_one :picture, :dependent => :destroy
  has_one :location, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
  accepts_nested_attributes_for :amenities, :reject_if => lambda { |a| a[:name].blank? },  :allow_destroy => true
  accepts_nested_attributes_for :location, :reject_if => lambda { |a| a[:address].blank? },  :allow_destroy => true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :property_type, presence: true, length: { maximum: 50 }
  validates :no_of_guests, presence: true
  validates :price_per_guest, presence: true
  validates :description, presence: true, length: { maximum: 200 }

   def feed
    Listing.all
    #debugger
    end 
end
