class ArticlesController < ApplicationController
  before_action :check_if_admin?, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # Public methods

  def index
    @articles = Article.all.sort_by(&:updated_at).reverse
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  # Admin methods

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article created!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "An error has occured. Try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :photo, :rich_body)
  end

  def check_if_admin?
    return if current_user.admin?

    flash[:alert] = "You are not allowed to perform this action."
    redirect_to articles_path
  end
end
