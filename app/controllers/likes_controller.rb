class LikesController < ApplicationController
  before_action :provide_article, only: %i[create destroy]

  def create
    Like.create!(user: current_user, article: @article)

    redirect_to @article
  end

  def destroy
    like = @article.likes.find_by(id: params[:id], user: current_user)
    like.destroy!

    redirect_to @article
  end

  private

  def provide_article
    @article = Article.find(params[:article_id])
  end
end