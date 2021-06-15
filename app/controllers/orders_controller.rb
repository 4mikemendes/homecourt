class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    order = Order.create!(tennis_court: booking.tennis_court, tennis_court_sku: booking.tennis_court.id, amount: booking.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: booking.tennis_court.court_name,
      amount: booking.tennis_court.price_cents,
      currency: 'eur',
      quantity: booking.hours.to_i
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
  @order = current_user.orders.find(params[:id])
  end
end
