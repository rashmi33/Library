Rails.application.routes.draw do
  resources :libraries
  resources :categories
  resources :books
  resources :members
  resources :issued_histories
  root 'welcomes#index'
end
