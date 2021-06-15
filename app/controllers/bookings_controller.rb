class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @booking.end_date_time = @booking.end_date_time.change(year: @booking.beginning_date_time.year, month: @booking.beginning_date_time.month, day: @booking.beginning_date_time.day)
    @booking.user = current_user
    @booking.status = "pending"
    @booking.tennis_court = @tennis_court
    if @booking.save
      @chatroom = Chatroom.create(booking: @booking)
      redirect_to tennis_court_path(@tennis_court)
    else
      @review = Review.new
      render "tennis_courts/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to tennis_court_path(@booking.tennis_court), notice: "status updated"
    else
      redirect_to tennis_court_path(@booking.tennis_court), notice: "#{@booking.errors.messages}"
    end
  end

  def booking_params
    params.require(:booking).permit(:status, :beginning_date_time, :end_date_time)
  end
end
