Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#main'
  resources :feeds
  resources :newssites
  resources :users
  resources :articles
  resources :chosensites

  get '/scrape', to: 'articles#scrape'
  get '/scrape2', to: 'articles#scrape2'
  get '/scrape3', to: 'articles#scrape3'
  get '/nyt', to: 'articles#nyt'

end
