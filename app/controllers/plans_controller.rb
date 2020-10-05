class PlansController < ApplicationController
  def show
    @plan = Plan.find(params[:id])
    if current_user.subscribed?
      subscription = Stripe::Subscription.retrieve(current_user.subscription_id)
      @default_payment_method = Stripe::PaymentMethod.retrieve(subscription.default_payment_method)
    end
  end
end
