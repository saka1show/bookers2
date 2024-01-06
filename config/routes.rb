Rails.application.routes.draw do

  get '/home', to:'homes#top'
  get 'homes/about' => 'homes#about', as:'about'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :show, :index, :edit, :update, :destroy], controller: :user_books do
      get '/:id', to: 'books#show', as:'book'
      get '/books' => 'books#index', as:'books'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
