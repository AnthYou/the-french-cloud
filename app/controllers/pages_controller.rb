class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :testimonials]

  def home
  end

  def testimonials
  end
end
