Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :reservations, only: %i[new create update edit destroy]
  end
  resources :users, only: [:index, :show].freeze
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
