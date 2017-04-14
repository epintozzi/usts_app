Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: [:new, :show]


get '/competition', to: 'pages#competition'
get '/sponsorship', to: 'pages#sponsorship'
get '/racing_resources', to: 'pages#racing_resources'

end
