class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc) #w nawiasie nazwa kolumny czyli klucz a następnie podajemy wartość czyli to desc
  end

  def new
    @article = Article.new
  end

  def create
    article_params = params.require(:article).permit(:title, :text)

    @article = Article.new(articles_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end


    #tu my mu podajemy dokładny obiekt, któremu on sam nadaje id
    #ścieżki do tego gdzie przekierować szukamy za pomocą komendy bin/rails router w konsoli
    #jeśli podajemy obiekt czyli @article, @book itd, przekierowuje nas zawsze do akcji show
    # redirect_to articles_path przekierowuje nas do listy artykułów

    # render plain: params[:articles].permit(:title, :text).inspect
    #chcemy wyrenderować zwykły tekst, który podajemy po plain, ale tu wpisujemy w to miejsce parametry
    #.permit definiuje dopuszczalne parametry do wywołania, to chroni np hasła
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article_params = params.require(:article).permit(:title, :text)

    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy!
    
    redirect_to articles_path
  end
end
