class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tennis_court
  validate :check_no_overlaping_date_ranges

  def check_no_overlaping_date_ranges
    if self.end_date_time <= self.beginning_date_time
      errors.add(:end_date_time, "Start should be after end and vice versa")
    end
    tennis_court.bookings.reject{|booking| booking = self}.each do |booking|
      raise
      if (booking.beginning_date_time..booking.end_date_time) === self.beginning_date_time
        errors.add(:beginning_date_time, "Court already booked at this time.....")
      end
    end
  end
end
