Rails.application.routes.draw do
  root 'welcome#index'

  get 'articles', to: 'articles#index'
  #jeśli wpiszesz po adresie głównym w przeglądarce 'articles' to on przejdzie do 'articles#index'
end
