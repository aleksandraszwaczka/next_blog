# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles
  resources :comments
  # , only: [:index, :show] 
  # lub zamiast only można użyć except i wylkuczyć część
end
