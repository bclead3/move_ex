MoveEx::Application.routes.draw do
  get 'sign_in' => "sessions#new", as: 'sign_in'
  get 'log_in'  => "sessions#new", as: 'log_in'
  delete 'log_out' => "sessions#destroy", as: 'log_out'
  delete 'sign_out'=> "sessions#destroy", as: 'sign_out'

  get 'sign_up' => "users#new", as: 'sign_up'

  root :to => "sessions#static"
  get '/'  => "sessions#static"

  get 'addresses' => "users#index"     # no index for addresses

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :addresses
  resources :user_attributes
end
