Rails.application.routes.draw do

  get 'homes/top'
  get 'homes/about' => 'homes#about', as:'about'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit]
  resources :books,only: [:new, :create, :show, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
