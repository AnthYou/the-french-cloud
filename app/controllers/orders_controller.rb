class OrdersController < ApplicationController
  def new
  end

  def create
    order = Order.create!(user: current_user, state: 'pending')
    session = Stripe::Checkout::Session.create(
      client_reference_id: current_user.stripe_id,
      customer: current_user.stripe_id,
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price: 'price_1HkoImAFmCis7vEtKfijVfv7',
        quantity: 1
      }],
      success_url: order_success_url,
      cancel_url: order_cancelled_url
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    if current_user.admin?
      @orders = Order.where(state: 'completed')
    else
      @orders = current_user.orders.where(state: 'completed')
    end
  end

  def cancelled
    flash[:alert] = "Your order was cancelled."
    redirect_to root_path
  end

  def success
    @order = current_user.orders.last
    @order.update(state: 'completed')
    payment_methods = JSON.parse(Stripe::PaymentMethod.list({
      customer: current_user.stripe_id,
      type: 'card'
    }).data.to_json)
    last_payment_method = payment_methods.first
    Stripe::PaymentMethod.detach(last_payment_method["id"]) if last_payment_method
    flash[:notice] = "You have successfully booked a private lesson."
    redirect_to order_path(@order)
  end
end
