Rails.application.routes.draw do
  # get 'buses/index'
  # get 'buses/new'
  # get 'buses/create'

  devise_for :customers
  devise_for :bus_owners

  resources :buses, only:[:index, :new, :create, :show] do
    collection do 
      get 'search'
    end
  end

  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "home#index"
end
