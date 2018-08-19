Rails.application.routes.draw do
  root 'welcome#index'

  get 'articles', to: 'articles#index'
  #jeśli wpiszesz po adresie głównym w przeglądarce 'articles' to on przejdzie do 'articles#index'
  get 'articles/new', to: 'articles#new', as: 'new_article'
  #as: zmienia nazwę prefixu
get 'articles/:id', to: 'articles#show', as: "article"
# :id , po dwukropku to jest parametr
  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'

  patch 'articles/:id', to: 'articles#update'
  #nie zdefiniowany put w edicie

  post 'articles', to: 'articles#create'
  #get czyta dane (tylko odczytuje)
  #post tworzy nowe zasoby
  #put aktualizuje zasoby
  #delete jest do usuwania zasbów, które istnieją
end
