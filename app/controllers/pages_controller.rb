class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def testimonials
  end

  def about_me
  end
end
