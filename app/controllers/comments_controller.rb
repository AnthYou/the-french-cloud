class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article = @article
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@article, anchor: 'article-comments')
    else
      flash[:alert] = "Comment can't be blank."
      redirect_to article_path(@article, anchor: 'article-comments')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
