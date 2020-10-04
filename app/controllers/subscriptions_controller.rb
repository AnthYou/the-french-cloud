class SubscriptionsController < ApplicationController
  def create
    @user = current_user
    customer = Stripe::Customer.retrieve(@user.stripe_id)
    subscription = Stripe::Subscription.list(customer: customer.id)
    @plan = Plan.find_by(stripe_id: JSON.parse(subscription.data[0].to_json)["items"]["data"][0]["plan"]["product"])
    @user.plan = @plan
    @user.subscription_id = JSON.parse(subscription.data[0].to_json)["id"]
    if @user.save
      flash[:notice] = "You have subscribed to #{@plan.name}"
      redirect_to root_path
    else
      flash[:alert] = "Oops, something went wrong"
      redirect_to root_path
    end
  end
end
