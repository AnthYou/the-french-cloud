class ChargesController < ApplicationController
  def new
    @subscription = current_user.subscription
  end
end
