Rails.application.routes.draw do

  devise_for :users
  resources :comments
  resources :vacins
  get 'home/about'
  get 'home/index_2'
  get 'home/index'
  root 'home#about'

end
