Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/login", to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resource :cart, only: [:create, :show, :destroy]
  resources :items, only: [:index]
  get "/:category_slug", to: "categories#show"

end
