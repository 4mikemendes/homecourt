class OrdersController < ApplicationController
  def create
    tennis_court = TennisCourt.find(params[:tennis_court_id])
    order = Order.create!(tennis_court: tennis_court, tennis_court_sku: tennis_court.sku, amount: tennis_court.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: tennis_court.sku,
      images: [tennis_court.photo_url],
      amount: tennis_court.price_cents,
      currency: 'eur',
      quantity: 1
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
