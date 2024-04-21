Rails.application.routes.draw do
  resources :post_tags
  resources :tags
  resources :comments
  
  resources :posts do
    resources :comments, only: [:new,:create]
  end
  resources :posts, only: [:index, :show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  

  #Página inicial
  get 'home/index'
  root 'home#index'

  #Uploads TXT
  post 'uploads', to: 'uploads#create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
