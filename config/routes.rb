Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
  # rubyonrails.org/routing.html
  # root "recipes#public_recipies"

  # resources :foods, expect: [:update]
  # resources :recipes, expect: [:update]

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/public_recipies', to: 'recipes#public_recipies'

  # get '/shopping_list', to: 'shopping_list#index'
  
  # resources :recipes do
  #   resources :recipe_foods
  # end
  # resources :users
  # put '/recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'toggle_recipe_public'
end
