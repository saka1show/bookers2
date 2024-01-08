Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/top', to:'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
