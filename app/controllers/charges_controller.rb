class ChargesController < ApplicationController
  def new
    @checkout = current_user.checkouts.where(state: 'pending').find(params[:checkout_id])
  end

  def cancelled
    flash[:notice] = "The payment was cancelled"
    redirect_to root_path
  end
end
