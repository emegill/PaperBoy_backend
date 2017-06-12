Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feeds
  resources :newssites
  resources :users
  resources :articles
  resources :chosensites

  get '/scrape', to: 'articles#scrape'

end
