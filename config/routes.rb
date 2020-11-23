Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'testimonials', to: 'pages#testimonials', as: 'testimonials'
  get 'about_me', to: 'pages#about_me', as: 'about_me'
  get 'faq', to: 'pages#faq', as: 'faq'
  get 'legal', to: 'pages#legal', as: 'legal'
  get 'rules', to: 'pages#rules', as: 'rules'
  get 'calendar', to: 'pages#calendar', as: 'calendar'

  resources :users, only: [:index, :show]

  resources :plans, only: [:index, :show]
  resources :lessons, only: [:index, :show]
  resources :exercises, only: [:index, :show]
  resources :articles do
    resources :comments, only: [:create]
  end

  resources :checkouts, only: [:create] do
    resources :charges, only: [:new]
  end

  resources :orders, only: [:index, :new, :create, :show] do
    resources :payments, only: :new
  end

  get 'order_cancelled', to: 'orders#cancelled', as: 'order_cancelled'
  get 'order_success', to: 'orders#success', as: 'order_success'

  get 'setup', to: 'checkouts#setup', as: 'setup_payment'
  post 'delete_card', to: 'checkouts#delete_payment_method', as: 'remove_payment_method'

  get 'subscriptions', to: 'subscriptions#create', as: 'create_subscriptions'
  post 'subscriptions', to: 'subscriptions#change_payment_method', as: 'subscription_change_payment_method'
  get 'charges', to: 'charges#cancelled', as: 'payment_cancelled'

  # mount StripeEvent::Engine, at: '/stripe-webhooks'
end
