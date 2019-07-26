class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :user_id, presence: true
  validates :listing_id, presence: true
  validates :no_of_guests, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  default_scope -> { order(created_at: :desc) }

  def feed
    Booking.all
    #debugger
  end
end
