class UsersController < ApplicationController
  before_action :check_if_subscriber?, only: :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def check_if_subscriber?
    unless user_signed_in? && current_user.subscribed?
      flash[:alert] = "You need to subscribe to a plan first."
      redirect_to root_path
    end
  end
end
