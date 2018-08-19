# frozen_string_literal:true

class ArticlesController < ApplicationController
  before_action :provide_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
    # w nawiasie nazwa kolumny czyli klucz a nastepnie podajemy wartosc czyli
    # to desc
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    # tu my mu podajemy dokładny obiekt, któremu on sam nadaje id
    # sciezki do tego gdzie przekierować szukamy za pomocą komendy bin/rails router
    # w konsoli
    # jesli podajemy obiekt czyli @article, @book itd, przekierowuje nas zawsze do
# akcji show
# redirect_to articles_path przekierowuje nas do listy artykułów
# render plain: params[:articles].permit(:title, :text).inspect
# chcemy wyrenderować zwykły tekst, który podajemy po plain, ale tu wpisujemy w to miejsce parametry
# .permit definiuje dopuszczalne parametry do wywołania, to chroni np hasła
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy!

    redirect_to articles_path
  end

  private

  def provide_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
