Rails.application.routes.draw do
  get '/introduction', to: 'static_pages#introduction'
  get '/auction', to: 'static_pages#auction'
  get '/event', to: 'static_pages#event'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :posts, only: [:index, :show, :create]
  delete 'posts/:id' => 'posts#destroy'

  root 'posts#index'
  get '/show', to: 'posts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
