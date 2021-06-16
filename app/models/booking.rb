class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tennis_court
  has_many :chatrooms, dependent: :destroy
  validate :check_no_overlaping_date_ranges
  validates :tennis_court, :user, presence: true
  def badge_status
    if status == "pending"
      return "badge-info"
    elsif status == "accepted"
      return "badge-success"
    elsif status == "rejected"
      return "badge-danger"
    end
  end

  def check_no_overlaping_date_ranges
    if self.end_date_time <= self.beginning_date_time
      errors.add(:end_date_time, "Court not available at this time")
    end
    tennis_court.bookings.each do |booking|
      if (booking.beginning_date_time..booking.end_date_time) === self.beginning_date_time
        errors.add(:beginning_date_time, "Court already booked at this time")
      end
    end
  end

  def hours
    dif = self.end_date_time - self.beginning_date_time
    dif = dif / 60 / 60
  end

  def price
    tennis_court.price_per_hour * 100 * self.hours.to_i
  end
end
