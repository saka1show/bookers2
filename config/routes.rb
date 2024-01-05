Rails.application.routes.draw do

  get '/home', to:'books#user_index', as:'user_books'
  get '/books' => 'books#index', as:'books'
  get 'homes/about' => 'homes#about', as:'about'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :index] do
    resources :books, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
