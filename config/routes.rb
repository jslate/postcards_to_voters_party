Rails.application.routes.draw do

  root 'welcome#main'

  resources :addresses do
    member do
      get :completed
      get :uncompleted
    end
    collection do
      get :next
      get :none_left
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
