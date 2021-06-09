class TennisCourt < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  has_many :schedules
  has_many :bookings
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
end
