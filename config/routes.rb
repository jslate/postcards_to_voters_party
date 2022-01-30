Rails.application.routes.draw do
  resources :users

  root 'welcome#main'
  post '/authenticate', to: "welcome#authenticate"
  get '/dashboard', to: "dashboard#index"

  resources :addresses do
    member do
      get :completed
      get :uncompleted
    end
    collection do
      get :add_from_text
      get :get_an_address
      get :next
      get :none_left
      post :bulk_add
    end
  end

  resources :campaigns

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  get '/auth/redirect' => 'auth0#redirect'
end
