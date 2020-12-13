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
    answers = params.reject do |k, _|
      params[k] == params[:id] ||
        params[k] == params[:controller] ||
        params[k] == params[:action] ||
        params[k] == params[:correction]
    end

    answers.each do |k, v|
      @useranswers << v
      @goodanswers << k
    end

    if params[:correction]
      good_answers = params[:correction].split(" ")
      @score = score(good_answers, @useranswers)
    else
      @score = score(@goodanswers, @useranswers)
    end
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
    comparison = goodanswers.map
                            .each_with_index { |answer, index| answer == useranswers[index] }
                            .reject { |answer| answer }
    "#{max_score - comparison.size}/#{max_score}"
  end
end
