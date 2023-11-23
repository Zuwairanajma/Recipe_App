Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # root "posts#index"

  # rubyonrails.org/routing.html
  root 'recipes#public_recipies'

  resources :foods, except: [:update]
  resources :recipes, except: [:update]

  # Defines the root path route ("/")
  # root "articles#index"

  get '/public_recipies', to: 'recipes#public_recipies'

  get '/shopping_list', to: 'shopping_list#index'

  resources :recipes do
    resources :recipe_foods
  end
  resources :users
  put '/recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'toggle_recipe_public'
end
