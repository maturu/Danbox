Rails.application.routes.draw do
  get '/introduction', to: 'static_pages#introduction'
  get '/auction', to: 'static_pages#auction'
  get '/event', to: 'static_pages#event'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/advertisement', to: 'static_pages#advertisement'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  delete 'posts/:id' => 'posts#destroy'

  root to: 'posts#index'
  get '/show', to: 'posts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
