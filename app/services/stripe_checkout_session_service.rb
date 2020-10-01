class StripeCheckoutSessionService
  def call(event)
    subscription = Subscription.find_by(checkout_session_id: event.data.object.id)
    subscription.update(active: true)
  end
end
