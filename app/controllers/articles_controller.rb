class ArticlesController < ApplicationController
  def index

  end

  def new

  end

  def create
    articles_params = params.require(:article).permit(:title, :text)

    @article = Article.new(articles_params)
    @article.save

    redirect_to articles_path
    #ścieżki do tego gdzie przekierować szukamy za pomocą komendy bin/rails router w konsoli


    # render plain: params[:articles].permit(:title, :text).inspect
    #chcemy wyrenderować zwykły tekst, który podajemy po plain, ale tu wpisujemy w to miejsce parametry
    #.permit definiuje dopuszczalne parametry do wywołania, to chroni np hasła
  end
end
