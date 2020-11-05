class UsersController < ApplicationController
  before_action :check_if_subscriber?, only: :index
  before_action :access_my_profile_only, only: :show

  def index
    @users = User.all.sort_by(&:first_name)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def check_if_subscriber?
    return if (user_signed_in? && current_user.subscribed?) || current_user.admin?

    flash[:alert] = "You need to subscribe to a plan first."
    redirect_to root_path
  end

  def access_my_profile_only
    return if (User.find(params[:id]) == current_user) || current_user.subscribed? || current_user.admin?

    flash[:alert] = "You need to subscribe to a plan first."
    redirect_to root_path
  end
end
