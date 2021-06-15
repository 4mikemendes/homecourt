class TennisCourt < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  has_many :schedules
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_by_court_name_and_address,
    against: [ :court_name, :address, :description, :surface_type ],
    using: {
      tsearch: { prefix: true }
    }
  validates :court_name, presence: true
  validates :address, presence: true
  validates :price_per_hour, presence: true
  validates :surface_type, presence: true

  def total_booked_hours
    total = 0
    bookings.where(status: "accepted").where("beginning_date_time < ? ", DateTime.now).each do |booking|
      booking_total = ((booking.end_date_time - booking.beginning_date_time) / (60 * 60)).to_i
      p booking_total
      total += booking_total
    end
    return total
  end

  monetize :price_cents
end
