Rails.application.routes.draw do

  root to: 'recipes#index'

  resources :ingredients
  resources :recipes

  get '/recipes/:id/add_ingredients' => 'recipes#add_ingredients', as: 'add_ingredients'
  
  post '/recipes/:id/add_ingredients' => 'recipes#create_ingredients'

end
