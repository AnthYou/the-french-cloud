class ExercisesController < ApplicationController
  before_action :check_if_ptit_french, only: [:show]

  def index
    @exercises = Exercise.all
    @listeningexercises = Exercise.where(category: Exercise::CATEGORIES[0]).sort_by(&:title).sort_by(&:level)
    @readingexercises = Exercise.where(category: Exercise::CATEGORIES[1]).sort_by(&:title).sort_by(&:level)
    @grammarexercises = Exercise.where(category: Exercise::CATEGORIES[2]).sort_by(&:title).sort_by(&:level)
    raise StandardError unless @exercises.size == @listeningexercises.size + @readingexercises.size + @grammarexercises.size
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  private

  def check_if_ptit_french
    return if current_user.subscribed? && current_user.plan.sku == 'ptit-french'

    flash[:alert] = "You must be subscribed to Le P'tit French to access this content"
    redirect_to root_path
  end
end
