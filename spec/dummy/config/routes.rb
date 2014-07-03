Rails.application.routes.draw do

  resources :tasks

  get 'home/index'

  root 'home#index'
  get '/home', to: "home#index", as: :home
  get '/home/index'

  mount Ottrick::Engine => "/ottrick"
end
