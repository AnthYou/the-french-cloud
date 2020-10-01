Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :users, only: [:index, :show]

  resources :plans, only: [:show]

  resources :subscriptions, only: [:create, :show] do
    resources :charges, only: [:new]
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
