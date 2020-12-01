class ExercisesController < ApplicationController
  before_action :check_if_subscriber?, only: [:show, :correction]

  def index
    @exercises = Exercise.all
    @listeningexercises = Exercise.where(category: Exercise::CATEGORIES[0]).sort_by(&:title).sort_by(&:level)
    @readingexercises = Exercise.where(category: Exercise::CATEGORIES[1]).sort_by(&:title).sort_by(&:level)
    @grammarexercises = Exercise.where(category: Exercise::CATEGORIES[2]).sort_by(&:title).sort_by(&:level)
    @verbalexercises = Exercise.where(category: Exercise::CATEGORIES[3]).sort_by(&:title).sort_by(&:level)
    raise StandardError unless @exercises.size == @listeningexercises.size + @readingexercises.size + @grammarexercises.size + @verbalexercises.size
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def correction
    @exercise = Exercise.find(params[:id])
    @goodanswers = []
    @useranswers = []
    answers = params.reject { |k, _| params[k] == params[:id] || params[k] == params[:controller] || params[k] == params[:action] }
    answers.each do |k, v|
      @useranswers << v
      @goodanswers << k
    end
    @score = score(@goodanswers, @useranswers)
  end

  private

  def check_if_ptit_french
    return if (current_user.subscribed? && current_user.plan.sku == 'ptit-french') || current_user.admin?

    flash[:alert] = "You must be subscribed to Le P'tit French to access this content"
    redirect_to root_path
  end

  def check_if_subscriber?
    return if current_user.subscribed? || current_user.admin?

    flash[:alert] = "You must be subscribed to a plan to access this content"
    redirect_to root_path
  end

  def score(goodanswers, useranswers)
    max_score = goodanswers.size
    "#{max_score - (goodanswers - useranswers).size}/#{max_score}"
  end
end
