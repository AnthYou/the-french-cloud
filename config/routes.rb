Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'testimonials', to: 'pages#testimonials', as: 'testimonials'
  get 'about_me', to: 'pages#about_me', as: 'about_me'

  resources :users, only: [:index, :show]

  resources :plans, only: [:show]

  resources :checkouts, only: [:create] do
    resources :charges, only: [:new]
  end

  get 'setup', to: 'checkouts#setup', as: 'setup_payment'
  post 'delete_card', to: 'checkouts#delete_payment_method', as: 'remove_payment_method'

  get 'subscriptions', to: 'subscriptions#create', as: 'create_subscriptions'
  post 'subscriptions', to: 'subscriptions#change_payment_method', as: 'subscription_change_payment_method'
  get 'charges', to: 'charges#cancelled', as: 'payment_cancelled'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
