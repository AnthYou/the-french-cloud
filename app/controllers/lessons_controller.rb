class LessonsController < ApplicationController
  before_action :check_if_ptit_french, only: [:show]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def check_if_ptit_french
    return if current_user.subscribed? && current_user.plan.sku == 'ptit-french'

    flash[:alert] = "You must be subscribed to Le P'tit French to access this content"
    redirect_to root_path
  end
end
