class TennisCourt < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
  has_many :schedules

  include PgSearch::Model
  pg_search_scope :search_by_court_name_and_address,
    against: [ :court_name, :address, :description, :surface_type ],
    using: {
      tsearch: { prefix: true }
    }
end
