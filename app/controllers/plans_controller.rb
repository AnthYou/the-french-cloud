class PlansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
    if current_user.subscribed?
      subscription = Stripe::Subscription.retrieve(current_user.subscription_id)
      @default_payment_method = Stripe::PaymentMethod.retrieve(subscription.default_payment_method)
    end
  end
end
