Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'
  get '/home', to: "home#index", as: :home
  get '/home/index'

  mount Ottrick::Engine => "/ottrick"
end
