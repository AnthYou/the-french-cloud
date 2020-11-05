class LessonsController < ApplicationController
  before_action :check_if_ptit_french, only: [:show]

  def index
    @lessons = Lesson.all
    @grammarlessons = Lesson.where(category: Lesson::CATEGORIES[0]).sort_by(&:title).sort_by(&:level)
    @verballessons = Lesson.where(category: Lesson::CATEGORIES[1]).sort_by(&:title).sort_by(&:level)
    @voclessons = Lesson.where(category: Lesson::CATEGORIES[2]).sort_by(&:title).sort_by(&:level)
    raise StandardError unless @lessons.size == @grammarlessons.size + @verballessons.size + @voclessons.size
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def check_if_ptit_french
    return if (current_user.subscribed? && current_user.plan.sku == 'ptit-french') || current_user.admin?

    flash[:alert] = "You must be subscribed to Le P'tit French to access this content"
    redirect_to root_path
  end
end
