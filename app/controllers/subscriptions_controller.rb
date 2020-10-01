class SubscriptionsController < ApplicationController
  def create
    plan = Plan.find(params[:plan_id])
    subscription = Subscription.create!(plan: plan, current_period_ends_at: Date.today >> 3, user: current_user)

    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price: plan.stripe_price_id,
          quantity: 1
        }],
        # subscription_data: { trial_period_days: 30 },
        mode: 'subscription',
        customer: current_user.stripe_id,
        client_reference_id: current_user.id,
        success_url: subscription_url(subscription),
        cancel_url: subscription_url(subscription),
    )

    subscription.update(checkout_session_id: session.id)
    redirect_to new_subscription_charge_path(subscription)
  end

  def show
    @subscription = current_user.subscription
  end
end
