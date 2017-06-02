Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: [:new, :show]

  resources :news

  resources :races, only: [:index, :show]

  resources :galleries, only: [:index, :show]

  resources :photos, only: [:show]

  resources :usts_registrations, only: [:new, :create]


  resources :race_registrations, only: [:index, :new, :create]
  get '/my_registrations', to: 'race_registrations#show'

  get '/competition', to: 'pages#competition'
  get '/sponsorship', to: 'pages#sponsorship'
  get '/racing_resources', to: 'pages#racing_resources'
  get '/results_2017', to: 'pages#results_2017' #TODO: remove after admin import is set up

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :races, except: [:show, :destroy]
    resources :news, only: :index
    resources :race_registrations, only: [:index, :show, :edit, :update, :destroy]
    resources :usts_registrations, only: [:index, :show, :edit, :update, :destroy]
    resources :boat_classes, except: [:show, :destroy]
    resources :sponsors, except: [:show, :destroy]
    resources :users, except: [:show, :destroy]
    resources :galleries, except: [:show]
    resources :photos, except: [:show]
    resources :race_results, only: [:index]
    resources :race_results do
      collection {post :import}
    end
  end

end
