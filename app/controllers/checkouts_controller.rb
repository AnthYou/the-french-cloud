class CheckoutsController < ApplicationController
  def create
    plan = Plan.find(params[:plan_id])
    checkout = Checkout.create!(plan: plan, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price: plan.stripe_price_id,
          quantity: 1
        }],
        subscription_data: { trial_from_plan: true },
        mode: 'subscription',
        customer: current_user.stripe_id,
        client_reference_id: current_user.id,
        success_url: create_subscriptions_url,
        cancel_url: payment_cancelled_url,
    )

    checkout.update(checkout_session_id: session.id)
    redirect_to new_checkout_charge_path(checkout)
  end

  def show
    @checkout = current_user.checkouts.find(params[:id])
  end
end
