Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :users, only: [:index, :show]

  resources :plans, only: [:show]

  resources :checkouts, only: [:create] do
    resources :charges, only: [:new]
  end

  get 'subscriptions', to: 'subscriptions#create', as: 'create_subscriptions'
  get 'charges', to: 'charges#cancelled', as: 'payment_cancelled'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
