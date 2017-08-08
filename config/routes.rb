Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: [:new, :show]

  resources :news

  resources :races, only: [:index, :show]

  resources :galleries, only: [:index, :show]

  resources :photos, only: [:show]

  resources :race_results, only: [:index]

  resources :usts_registrations, only: [:new, :create]


  resources :race_registrations, only: [:index, :new, :create]
  get '/my_registrations', to: 'race_registrations#show'

  get '/competition', to: 'pages#competition'
  get '/sponsorship', to: 'pages#sponsorship'
  get '/racing_resources', to: 'pages#racing_resources'

  get '/cart', to: 'shopping_cart#show'
  get '/thank_you', to: 'shopping_cart#thank_you'
  post '/cart', to: 'shopping_cart#create', as: :submit_payment

  post "/hook" => "shopping_cart#hook"

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :races, except: [:show]
    resources :news, only: :index
    resources :race_registrations, only: [:index, :show, :edit, :update, :destroy]
    resources :usts_registrations, only: [:index, :show, :edit, :update, :destroy]
    resources :boat_classes, except: [:show]
    resources :sponsors, except: [:show, :destroy]
    resources :users, except: [:show, :destroy]
    resources :galleries, except: [:show]
    resources :photos, except: [:show]
    resources :race_results, only: [:index, :edit, :update, :destroy]
    resources :race_results do
      collection {post :import}
    end
    resources :usts_registrations do
      collection {post :import}
    end
  end

end
