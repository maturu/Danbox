Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/card', to: 'static_pages#card'
  post '/modal', to: 'static_pages#modal'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    :omniauth_callbacks => "omniauth_callbacks"
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
