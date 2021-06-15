class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.new
    if @chatroom.save
      redirect_to booking_chatroom_path(@booking, @chatroom)
    else
      redirect_to tennis_court_path(@booking.tennis_court)
    end
  end
end
