class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @booking.user = current_user
    @booking.status = "pending"
    @booking.tennis_court = @tennis_court
    if @booking.save!
      redirect_to tennis_court_path(@tennis_court)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to tennis_court_path(@booking.tennis_court), notice: "status updated"
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
