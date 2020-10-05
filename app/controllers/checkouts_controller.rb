class CheckoutsController < ApplicationController
  def create
    plan = Plan.find(params[:plan_id])

    if user_signed_in? && current_user.subscribed? && current_user.plan == plan
      flash[:alert] = "You already subscribed to #{plan.name}"
      redirect_to root_path
    elsif user_signed_in? && current_user.subscribed?
      subscription = Stripe::Subscription.retrieve(current_user.subscription_id)

      Stripe::Subscription.update(
        subscription.id,
        {
          cancel_at_period_end: false,
          proration_behavior: 'create_prorations',
          trial_end: 'now',
          items: [
            {
              id: subscription.items.data[0].id,
              price: plan.stripe_price_id
            }
          ]
        }
      )

      flash[:notice] = "You have changed your subscription plan to #{plan.name}"
      redirect_to create_subscriptions_url
    else
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
        cancel_url: payment_cancelled_url
      )

      checkout.update(checkout_session_id: session.id)
      redirect_to new_checkout_charge_path(checkout)
    end
  end

  def show
    @checkout = current_user.checkouts.find(params[:id])
  end

  def setup
    if user_signed_in?
      cards = Stripe::PaymentMethod.list({ customer: current_user.stripe_id, type: 'card' })
      @cards = JSON.parse(cards.data.to_json)

      if current_user.subscribed?
        @subscription = Stripe::Subscription.retrieve(current_user.subscription_id)
        @plan = Plan.find_by(stripe_id: @subscription.plan.product)
        @default_payment_method = Stripe::PaymentMethod.retrieve(@subscription.default_payment_method)
      end

      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        mode: 'setup',
        customer: current_user.stripe_id,
        success_url: root_url,
        cancel_url: root_url
      )
      @session.checkout_session_id = @session.id
    else
      flash[:alert] = "You need to be signed in first"
      redirect_to root_path
    end
  end
end
