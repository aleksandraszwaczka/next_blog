Rails.application.routes.draw do
  root 'welcome#index'

  get 'articles', to: 'articles#index'
  #jeśli wpiszesz po adresie głównym w przeglądarce 'articles' to on przejdzie do 'articles#index'
  get 'articles/new', to: 'articles#new', as: 'new_article'
  #as: zmienia nazwę prefixu
  post 'articles', to: 'articles#create'
  #get czyta dane (tylko odczytuje)
  #post tworzy nowe zasoby
  #put aktualizuje zasoby
  #delete jest do usuwania zasbów, które istnieją
end
