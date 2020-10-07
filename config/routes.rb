Rails.application.routes.draw do

  root 'welcome#main'
  post '/authenticate', to: "welcome#authenticate"
  get '/logout', to: "welcome#logout"

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
