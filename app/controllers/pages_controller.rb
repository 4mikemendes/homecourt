class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @tennis_court = TennisCourt.new
  end

  def dashboard
    @tennis_courts = current_user.tennis_courts
    @mybookings = current_user.bookings
  end
end
